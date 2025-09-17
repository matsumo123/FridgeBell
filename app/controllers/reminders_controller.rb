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

  def destroy
    @reminder = current_user.reminder
    @reminder.destroy!
    redirect_to reminder_path,
                notice: "リマインド設定を削除しました",
                status: :see_other
  end

  private

  def reminder_params
    params.require(:reminder).permit(:user_id, :days_before, :remind_time)
  end
end
