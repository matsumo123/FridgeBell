class Form::FoodActionCollection < Form::Base
  attr_accessor :food_actions, :user

  def initialize(user, attributes = {})
    @user = user
    super attributes
    self.food_actions = default_food_actions if self.food_actions.blank?
  end

  def default_food_actions
    @user.user_foods.order(deadline_date: :asc).map do |uf|
      FoodAction.new(user_id: @user.id, user_food_id: uf.id)
    end
  end

  def food_actions_attributes=(attributes)
    self.food_actions = attributes.map do |_, v|
      FoodAction.new(v.merge(user_id: @user.id))
    end
  end

  def save
    success = false
    ActiveRecord::Base.transaction do
      availability_foods = self.food_actions.select(&:availability)

      # チェックが1つもついていなかったらエラー
      if availability_foods.blank?
        errors.add(:base, :availability_required_message)
        raise ActiveRecord::Rollback
      end

      # チェックされた食材ごとにFoodActionに保存し、UserFoodの数量を更新または削除
      availability_foods.each do |af|
        af.save!
        user_food = UserFood.find_by!(id: af.user_food_id, user_id: @user.id)
        subtraction = user_food.quantity - af.quantity
        if subtraction > 0
          user_food.update!(quantity: subtraction)
        else
          user_food.destroy!
        end
      end

      uc = @user.user_character
      at = Time.current

      any_discard = availability_foods.any?(&:discarded?)
      any_consume = availability_foods.any?(&:consumed?)

      # 廃棄の場合は、連続日数をリセット
      # 消費の場合は、当日未消費なら連続日数を更新
      if any_discard
        uc.apply_discard!(at)
      elsif any_consume
        uc.apply_consumption!(at) unless uc.registered_today?(at)
      end

      success = true
    end
  success
  rescue => e
    Rails.logger.warn(e.message)
    false
  end
end
