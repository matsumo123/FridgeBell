class FoodActionsController < ApplicationController
  before_action :authenticate_user!
  def index
    range = Time.current.beginning_of_month..Time.current.end_of_month
    month_data = FoodAction.where(user_id: current_user.id, action_date: range)
    counts = month_data.group(:action_type).count
    total = counts.values.sum
    percentages = counts.transform_values { |v| total.zero? ? 0 : (v * 100 / total).round(0) }

    @display = {
      "廃棄" => percentages.fetch("discarded", percentages.fetch(:discarded, 0)),
      "消費" => percentages.fetch("consumed", percentages.fetch(:consumed, 0))
    }

    @top_consumed = FoodAction
      .where(user_id: current_user.id, action_type: :consumed, action_date: range)
      .group(:food_name, :unit)
      .select('food_name, unit, SUM(quantity) AS total_quantity')
      .order('total_quantity DESC')
      .limit(3)
    
    @top_discarded = FoodAction
      .where(user_id: current_user.id, action_type: :discarded, action_date: range)
      .group(:food_name, :unit)
      .select('food_name, unit, SUM(quantity) AS total_quantity')
      .order('total_quantity DESC')
      .limit(3)
  end

  def history
    if params[:month].present?
      begin
        @month = Time.strptime(params[:month], "%Y-%m")
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
