class RemindersController < ApplicationController
  before_action :authenticate_user!

  def show
    @reminder = current_user.reminder
  end

  def new
    @reminder = Reminder.new
  end

  def create
    @reminder = current_user.build_reminder(reminder_params)
    if @reminder.save
      redirect_to reminder_path, notice: "リマインド設定が完了しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def reminder_params
    params.require(:reminder).permit(:user_id, :days_before, :remind_time)
  end
end
