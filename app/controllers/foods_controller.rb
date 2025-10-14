class FoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_food, only: %i[ edit update destroy delete_food_image ]

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
    @foods = Food.by_category(params[:category_id]).where("name like ?", "%#{params[:q]}%").order(:name).limit(10)
    respond_to do |format|
      format.js
    end
  end

  def delete_food_image
    attachment = @food.food_image.attachment
    frame_id = view_context.dom_id(attachment)
    @food.food_image.purge
    respond_to do |format|
      format.turbo_stream do
        html = view_context.tag.turbo_frame(id: frame_id) do
          view_context.image_tag("", data: { previews_target: "preview" })
        end
        render turbo_stream: turbo_stream.replace(frame_id, html: html)
      end
      format.html { redirect_back fallback_location: edit_food_path(@food) }
    end
  end

  def favorites
    @categories = Category.custom_order
    @favorite_foods = current_user.favorite_foods
    @form = Form::UserFoodCollection.new(current_user, @favorite_foods)
  end

  private

  def food_params
    params.require(:food).permit(:name, :category_id, :quantity, :unit, :default_deadline, :food_image)
  end

  def find_user_food
    @food = current_user.foods.find(params[:id])
  end
end
