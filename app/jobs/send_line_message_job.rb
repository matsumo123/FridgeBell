class SendLineMessageJob < ApplicationJob
  queue_as :default

  sidekiq_options retry: 1
  sidekiq_retry_in do |_count|
    60
  end

  def perform
    NotificationService.call
  end
end
