class FoodActionsController < ApplicationController
  before_action :authenticate_user!
  def history
    @action_foods = current_user.food_actions.where(action_date: Time.current.beginning_of_month..Time.current.end_of_month).page(params[:page]).per(15)
  end
end
