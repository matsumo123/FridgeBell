class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_food, only: %i[ edit update destroy ]

  def new
    @food = current_user.foods.new(category_id: params[:category_id])
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to new_user_food_path(category_id: @food.category_id),
                  status: :see_other,
                  notice: t("helpers.flash_messages.foods_list_add")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @food.update(food_params)
      redirect_to new_user_food_path(category_id: @food.category_id),
                  status: :see_other,
                  notice: t("helpers.flash_messages.foods_list_update")
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy!
    redirect_to new_user_food_path(category_id: @food.category_id),
                status: :see_other,
                notice: t("helpers.flash_messages.foods_list_delete")
  end

  def autocomplete
    @foods = Food.where("name like ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :category_id, :quantity, :unit, :default_deadline)
  end

  def find_user_food
    @food = current_user.foods.find(params[:id])
  end
end
