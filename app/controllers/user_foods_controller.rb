class UserFoodsController < ApplicationController
  before_action :authenticate_user!
  def new
    @categories = Category.order(id: :asc)
    @foods = Food.where(category_id: params[:category_id]).order(name: :asc)
    @user_food = current_user.user_foods.new
  end

  def create
    @user_food = current_user.user_foods.build(user_foods_params)
    if @user_food.save
      redirect_to user_foods_path, notice: "冷蔵庫に食材を登録しました"
    else
      @categories = Category.order(id: :asc)
      @foods = Food.where(category_id: params[:category_id]).order(name: :asc)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_foods_params
    params.require(:user_food).permit(:food_id, :quantity, :deadline_date, :mini_memo)
  end
end
