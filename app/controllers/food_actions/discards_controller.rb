module FoodActions
  class DiscardsController < ApplicationController
    before_action :authenticate_user!
    before_action :user_foods_present?, only: %i[ new ]
    def new
      @form = Form::FoodActionCollection.new(current_user)
    end

    def create
      @form = Form::FoodActionCollection.new(current_user, collection_params)
      if @form.save
        redirect_to character_stage_path, notice: t("helpers.flash_messages.discarded_foods")
      else
        @user_foods = current_user.user_foods.includes(:food).order(deadline_date: :asc)
        render :new, status: :unprocessable_entity
      end
    end

    private

    def collection_params
      params.require(:form_food_action_collection).permit(food_actions_attributes: [ :user_food_id, :action_type, :action_date, :quantity, :availability ])
    end

    def user_foods_present?
      @user_foods = current_user.user_foods.includes(:food).order(deadline_date: :asc)
      unless @user_foods.present?
        redirect_to home_path, alert: t("helpers.flash_messages.no_food_items")
      end
    end
  end
end
