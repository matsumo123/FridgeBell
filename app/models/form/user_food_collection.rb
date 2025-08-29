class Form::UserFoodCollection < Form::Base
  attr_accessor :user_foods, :user, :foods

  def initialize(user, foods, attributes = {})
    @user = user
    @foods = foods
    super attributes
    self.user_foods = default_user_foods if self.user_foods.blank?
  end

  def default_user_foods
    @foods.map do |f|
      UserFood.new(user_id: @user.id, food_id: f.id)
    end
  end

  def user_foods_attributes=(attributes)
    self.user_foods = attributes.map do |_, v|
      UserFood.new(v.merge(user_id: @user.id))
    end
  end

  def select_user_foods
    # quantity>0の食材を取得
    self.user_foods.select { |uf| (uf.quantity || 0).to_f > 0 }
  end


  def save
    registered_user_foods = select_user_foods
    # 空だった場合は1つ以上の食材の数量を選択するよう にエラー
    if registered_user_foods.blank?
      errors.add(:base, :quantity_required_message)
      return false
    end
    UserFood.transaction do
      # すでに登録済みのuser_foodsのfood_id, deadline_dateを取得
      rows = @user.user_foods.index_by { |uf| [ uf.food_id, uf.deadline_date ] }
      registered_user_foods.each do |ruf|
        # フォームから取得した食材が登録済みの食材と期限が一致している場合は既存のデータを更新
        # 新規または期限が異なる場合は新規登録
        if rows.key?([ ruf.food_id, ruf.deadline_date ])
          existing = rows[[ ruf.food_id, ruf.deadline_date ]]
          sum = existing.quantity + ruf.quantity.to_f
          if sum > 100
            errors.add(:base, :quantity_max_one_hundred)
          end
          existing.update!(quantity: sum)
        else
          ruf.save!
        end
      end
    end
    true
  rescue => e
    Rails.logger.warn(e.message)
    false
  end
end
