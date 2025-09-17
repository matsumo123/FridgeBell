class RemindersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_reminder, only: %i[show edit update destroy]

  def show; end

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

  def edit; end

  def update
    @reminder = current_user.reminder
    if @reminder.update(reminder_params)
      redirect_to reminder_path, notice: "リマインド設定を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reminder.destroy!
    redirect_to reminder_path,
                notice: "リマインド設定を削除しました",
                status: :see_other
  end

  private

  def reminder_params
    params.require(:reminder).permit(:user_id, :days_before, :remind_time)
  end

  def user_reminder
    @reminder = current_user.reminder
  end
end
