class RemindersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def new
    @reminder = Reminder.new
  end

  def create
  end
end
