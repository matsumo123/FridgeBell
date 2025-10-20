class NotificationService
  def self.call
    new.call
  end

  def call
    send_push_message
  end

  private

  def send_push_message
    push_request = Line::Bot::V2::MessagingApi::PushMessageRequest.new(
      to: "Ua160fc3901fa36ebdd6a90f9b9c928c3",
      messages: [
        Line::Bot::V2::MessagingApi::TextMessage.new(
          text: "こんにちは☺️テスト配信を行っております！！！"
        )
      ]
    )
    
    response, status_code, headers = LINE_CLIENT.push_message_with_http_info(
      push_message_request: push_request
    )
    Rails.logger.info("[LINE push] status: #{status_code} headers: #{headers.inspect} body: #{response.inspect}")
  end
end
