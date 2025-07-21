class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :category_id_present?, only: %i[ index ]
  before_action :find_user_food, only: %i[ edit update destroy ]

  def index
    @categories = Category.order(id: :asc)
    @foods = Food.where(category_id: params[:category_id]).order(name: :asc)
  end

  def new
    @food = current_user.foods.new(category_id: params[:category_id])
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to foods_path(category_id: @food.category_id), notice: t('helpers.flash_messages.foods_list_add')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @food.update(food_params)
      redirect_to foods_path(category_id: @food.category_id), notice: t('helpers.flash_messages.foods_list_update')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @food.destroy!
    @foods = current_user.foods.where(category_id: @food.category_id)
    flash.now[:notice] = t('helpers.flash_messages.foods_list_delete')
  end

  private

  def food_params
    params.require(:food).permit(:name, :category_id, :quantity, :unit, :default_deadline)
  end

  def category_id_present?
    if params[:category_id].blank?
      redirect_to foods_path(category_id: 1)
    end
  end

  def find_user_food
    @food = current_user.foods.find(params[:id])
  end
end
