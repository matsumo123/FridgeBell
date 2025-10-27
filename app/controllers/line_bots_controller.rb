class LineBotsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]

  def webhook
  end

  def new
  end

  def create
  end
end
