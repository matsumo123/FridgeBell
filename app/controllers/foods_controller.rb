class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_food, only: %i[ edit update destroy ]

  def new
    @food = current_user.foods.new(category_id: params[:category_id])
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      @foods = Food.where(category_id: @food.category_id).order(name: :asc)
      @user_food = current_user.user_foods.new
      flash.now[:notice] = t("helpers.flash_messages.foods_list_add")
      render turbo_stream: [
        turbo_stream.replace("foods", partial: "user_foods/new_form", locals: { foods: @foods, user_food: @user_food }),
        turbo_stream.update("flash", partial: "shared/flash_message")
      ]
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @food.update(food_params)
      @foods = Food.where(category_id: @food.category_id).order(name: :asc)
      @user_food = current_user.user_foods.new
      flash.now[:notice] = t("helpers.flash_messages.foods_list_update")
      render turbo_stream: [
        turbo_stream.replace("foods", partial: "user_foods/new_form", locals: { foods: @foods, user_food: @user_food }),
        turbo_stream.update("flash", partial: "shared/flash_message")
      ]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy!
    flash.now[:notice] = t("helpers.flash_messages.foods_list_delete")
    @foods = Food.where(category_id: @food.category_id).order(name: :asc)
    @user_food = current_user.user_foods.new
    render turbo_stream: [
      turbo_stream.update("foods", partial: "user_foods/new_form", locals: { foods: @foods, user_food: @user_food }),
      turbo_stream.update("flash", partial: "shared/flash_message")
    ]
  end

  private

  def food_params
    params.require(:food).permit(:name, :category_id, :quantity, :unit, :default_deadline)
  end

  def find_user_food
    @food = current_user.foods.find(params[:id])
  end
end
