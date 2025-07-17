class Food < ApplicationRecord
  has_one_attached :food_image
  belongs_to :category
  belongs_to :user, optional: true
  validates :category_id, presence: true
  validates :name, presence: true
  validates :quantity, presence: true
  validates :unit, presence: true
  validate :check_default_food
  validate :check_same_name_food

  private

  # デフォルト食材が既にデフォルト食材名として登録されていた場合は登録不可
  # 管理画面でデフォルト食材を作成・編集する際に有効
  def check_default_food
    if user_id.nil? && Food.where(name: name, user_id: nil).where.not(id: self.id).exists?
      errors.add(:name, "すでに登録している名前は使用できません")
    end
  end

  # ユーザーが食材を追加する際に既にデフォルト食材名として使用してた場合は登録不可
  # ユーザーが既に登録した食材名は使用できない
  def check_same_name_food
    if user_id.present? && Food.exists?(name: name, user_id: nil)
      errors.add(:name, "デフォルトで登録されている名前は使用できません")
    end
    if user_id.present? && Food.where(name: name, user_id: user.id).    where.not(id: self.id).exists?
      errors.add(:name, "すでに登録している名前は使用できません")
    end
  end
end
