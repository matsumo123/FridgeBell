class FoodActionsController < ApplicationController
  before_action :authenticate_user!
  def consume
    @user_foods = current_user.user_foods.includes(:food).order(deadline_date: :asc)
    @form = Form::FoodActionCollection.new(current_user)
  end

  def discard
    @user_foods = current_user.user_foods.includes(:food).order(deadline_date: :asc)
  end

  def create
    @form = Form::FoodActionCollection.new(current_user, collection_params)
    if @form.save
      redirect_to home_path, notice: "食材を消費しました"
    else
      flash.now[:alert] = "食材を消費できませんでした"
      @user_foods = current_user.user_foods.includes(:food).order(deadline_date: :asc)
      render :consume, status: :unprocessable_entity
    end
  end

  private

  def collection_params
    params.require(:form_food_action_collection).permit(food_actions_attributes: [:user_food_id, :action_type, :action_date, :quantity, :availability])
  end
end
