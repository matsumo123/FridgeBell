class UserFoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_registered_user_food, only: %i[ edit update]
  def index
    @user_foods = current_user.user_foods.includes(:food).order(deadline_date: :asc)
  end

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

  def edit; end

  def update
    if @user_food.update(user_foods_params)
      flash[:notice] = "冷蔵庫内の食材情報を更新しました"
      render turbo_stream: [
        turbo_stream.replace(@user_food),
        turbo_stream.update("flash", partial: "shared/flash_message")
      ]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_foods_params
    params.require(:user_food).permit(:food_id, :quantity, :deadline_date, :mini_memo)
  end

  def find_registered_user_food
    @user_food = current_user.user_foods.find(params[:id])
  end
end
