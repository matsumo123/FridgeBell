class Form::FoodActionCollection < Form::Base
  attr_accessor :food_actions, :user

  def initialize(user, attributes = {})
    @user = user
    super attributes
    self.food_actions ||= default_food_actions
  end

  def default_food_actions
    [ FoodAction.new ]
  end

  def food_actions_attributes=(attributes)
    self.food_actions = attributes.map do |_, v|
      FoodAction.new(v.merge(user_id: @user.id))
    end
  end

  def save
    FoodAction.transaction do
      availability_foods = self.food_actions.select(&:availability)
      if availability_foods.blank?
        errors.add(:base, "食材を1つ以上選択してください")
        return false
      end
      availability_foods.each do |availability_food|
        if availability_food.save
          user_food = UserFood.find_by(id: availability_food.user_food_id, user_id: @user.id)
          subtraction = user_food.quantity - availability_food.quantity
          if subtraction > 0
            user_food.update!(quantity: subtraction)
          else
            user_food.destroy!
          end
        else
          puts availability_food.errors.full_messages
          raise ActiveRecord::Rollback
        end
      end
    end
    true
  rescue => e
    puts e.message
    false
  end
end
