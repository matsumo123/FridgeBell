class Food < ApplicationRecord
  has_one_attached :food_image
  belongs_to :category
  belongs_to :user, optional: true
  has_many :user_foods, dependent: :destroy
  validates :category_id, presence: true
  validates :name, presence: true, length: { maximum: 15 }
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :unit, presence: true, length: { maximum: 5 }
  validates :default_deadline, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validate :check_default_food
  validate :check_same_name_food

  scope :user_foods, ->(user) { where(user_id: [ nil, user.id ]) }
  scope :by_category, ->(category_id) { where(category_id: category_id) }

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

  def image_content_type
    if food_image.attached? && !food_image.content_type.in?(%w[image/jpeg image/png image/webp])
      errors.add(:food_image, ":ファイル形式がJPEG, PNG, WebP以外になっています。ファイル形式をご確認ください。")
    end
  end

  def image_size
    if food_image.attached? && food_image.blob.byte_size > 5.megabytes
      errors.add(:food_image, ":5MB以下のファイルをアップロードしてください。")
    end
  end
end
