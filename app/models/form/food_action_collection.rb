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
      self.food_actions.each do |food_action|
        if food_action.availability
          if food_action.save
            user_food = UserFood.find_by(id: food_action.user_food_id, user_id: @user.id)
            subtraction = user_food.quantity - food_action.quantity
            if subtraction > 0
              user_food.update!(quantity: subtraction)
            else
              user_food.destroy!
            end
          else
            puts food_action.errors.full_messages
            raise ActiveRecord::Rollback
          end
        end
      end
    end
    true
  rescue => e
    puts e.message
    false
  end
end
