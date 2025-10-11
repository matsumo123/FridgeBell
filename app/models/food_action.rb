class FoodAction < ApplicationRecord
  belongs_to :user
  belongs_to :user_food, optional: true
  enum :action_type, { consumed: 0, discarded: 1 }, validate: true

  validates :user_id, :user_food_id, :action_type, :action_date, :quantity, :food_name, :unit, presence: true
  validates :quantity, numericality: { greater_than: 0, less_than_or_equal_to: 100 }
  validates :availability, inclusion: { in: [ true, false ] }
  validates :food_name, length: { maximum: 15 }
  validates :unit, length: { maximum: 5 }

  scope :this_month, ->(user, time = Time.current) { where(user_id: user.id, action_date: time.all_month) }
  scope :consumed, -> { where(action_type: :consumed) }
  scope :discarded, -> { where(action_type: :discarded) }
  scope :top3_by_total_quantity, ->(limit = 3) {
    group(:food_name, :unit)
      .select("food_name, unit, SUM(quantity) AS total_quantity")
      .order("total_quantity DESC")
      .limit(limit)
    }
  scope :ranking, -> {
    group(:food_name, :unit)
      .select("food_name, unit, SUM(quantity) AS total_quantity")
      .order("total_quantity DESC")
  }

  before_validation :set_snapshot_data, on: [ :create ]

  private

  def set_snapshot_data
    if user_food.present? && user_food.food.present?
      f = user_food.food
      if food_name.blank?
        self.food_name = f.name
      end
      if unit.blank?
        self.unit = f.unit
      end
    end

    if food_name.blank?
      self.food_name = "不明"
    end

    if unit.blank?
      self.unit = "個"
    end
  end
end
