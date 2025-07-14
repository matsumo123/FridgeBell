class HomesController < ApplicationController
  before_action :authenticate_user!, only: %i[ home ]
  before_action :logged_in_user, only: %i[top]

  def top; end

  def home; end

  private

  def logged_in_user
    if user_signed_in?
      redirect_to home_path, notice: t("helpers.flash_messages.logged_in_user")
    end
  end
end
