class FoodActionsController < ApplicationController
  before_action :authenticate_user!
  def index
    month_data = FoodAction.where(user_id: current_user.id, action_date: Time.current.beginning_of_month..Time.current.end_of_month)
    counts = month_data.group(:action_type).count
    total = counts.values.sum

    percentages = counts.transform_values { |v| total.zero? ? 0 : (v * 100 / total).round(0) }

    @display = {
      "消費" => percentages.fetch("consumed", percentages.fetch(:consumed, 0)),
      "廃棄" => percentages.fetch("discarded", percentages.fetch(:discarded, 0))
    }
  end

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
