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
      flash.now[:notice] = "リマインド設定が完了しました"
      render turbo_stream: [
        turbo_stream.replace("reminder", @reminder),
        turbo_stream.update("flash", partial: "shared/flash_message")
      ]
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @reminder = current_user.reminder
    if @reminder.update(reminder_params)
      flash.now[:notice] = "リマインド設定を更新しました"
      render turbo_stream: [
        turbo_stream.update("reminder", partial: "reminder", locals: { reminder: @reminder }),
        turbo_stream.update("flash", partial: "shared/flash_message")
      ]
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @reminder.destroy!
    flash.now[:notice] = "リマインド設定を削除しました"
    render turbo_stream: [
      turbo_stream.update("reminder", partial: "reminder", locals: { reminder: nil }),
      turbo_stream.update("flash", partial: "shared/flash_message")
    ]
  end

  private

  def reminder_params
    params.require(:reminder).permit(:user_id, :days_before, :remind_time)
  end

  def user_reminder
    @reminder = current_user.reminder
  end
end
