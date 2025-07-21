class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :category_id_present?, only: %i[ index ]

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
      redirect_to foods_path, notice: "食品リストを追加しました"
    else
      render :new, status: :unprocessable_entity
    end
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
end
