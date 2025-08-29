class UserFoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_registered_user_food, only: %i[ edit update destroy]
  def index
    @user_foods = current_user.user_foods.includes(:food).order(deadline_date: :asc)
  end

  def new
    @categories = Category.custom_order
    @q = Food.user_foods(current_user).by_category(params[:category_id]).ransack(params[:q])
    @foods = @q.result(distinct: true).order(name: :asc).page(params[:page])
    @form = Form::UserFoodCollection.new(current_user, @foods)
  end

  def create
    @foods = Food.user_foods(current_user).by_category(params[:category_id]).order(name: :asc)
    @form = Form::UserFoodCollection.new(current_user, @foods, user_foods_params)
    if @form.save
      @user_food = current_user.user_foods.order(created_at: :desc).first
      flash[:notice] = t("helpers.flash_messages.user_foods_create")
      render turbo_stream: [
        turbo_stream.replace("user_food", partial: "user_foods/user_food", locals: { user_food: @user_food }),
        turbo_stream.update("flash", partial: "shared/flash_message")
      ]
    else
      @categories = Category.custom_order
      @q = Food.user_foods(current_user).by_category(params[:category_id]).ransack(params[:q])
      @foods = @q.result(distinct: true).order(name: :asc).page(params[:page])
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @user_food.update(update_params)
      flash.now[:notice] = t("helpers.flash_messages.user_foods_update")
      render turbo_stream: [
        turbo_stream.replace(@user_food),
        turbo_stream.update("flash", partial: "shared/flash_message")
      ]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user_food.destroy!
    flash.now[:notice] = t("helpers.flash_messages.user_foods_delete")
    render turbo_stream: [
      turbo_stream.remove(@user_food),
      turbo_stream.update("flash", partial: "shared/flash_message")
    ]
  end

  private

  def update_params
    params.require(:user_food).permit(:food_id, :quantity, :deadline_date, :mini_memo)
  end

  def user_foods_params
    params.require(:form_user_food_collection).permit(user_foods_attributes:  [ :food_id, :quantity, :deadline_date, :mini_memo ])
  end

  def find_registered_user_food
    @user_food = current_user.user_foods.find(params[:id])
  end
end
