class FoodActionsController < ApplicationController
  before_action :authenticate_user!
  def history
    if params[:month].present?
      begin
        @month = Date.strptime(params[:month], "%Y-%m")
      rescue ArgumentError
        @month = Time.current.beginning_of_month
      end
    else
      @month = Time.current.beginning_of_month
    end 
    from = @month.beginning_of_month
    to = @month.end_of_month
    @action_foods = current_user.food_actions.where(action_date: from..to).order(:action_date).page(params[:page]).per(15)
  end
end
