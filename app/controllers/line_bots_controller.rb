class LineBotsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  skip_before_action :verify_authenticity_token, only: %i[webhook]

  def webhook
    body = request.body.read
    signature = request.env["HTTP_X_LINE_SIGNATURE"]

    begin
      events = LINE_WEBHOOK_PARSER.parse(body: body, signature: signature)

      events.each do |event|
        handle_event(event)
      end

      head :ok
    rescue Line::Bot::V2::WebhookParser::InvalidSignatureError
      logger.error "Invalid signature from LINE"
      head :bad_request
    end
  end

  def new
    if current_user.uid.present?
      flash[:notice] = "LINE連携が完了しました"
      redirect_to home_path
    else
      @token = params[:state]
    end
  end

  def create
    @line_bot_token = LineBotToken.find_by(token: params[:token])
    current_user.update(uid: @line_bot_token.line_user_id)
    @line_bot_token.destroy
    flash[:notice] = "LINE連携が完了しました"
    redirect_to home_path
  end

  private

  def handle_event(event)
    case event
    when Line::Bot::V2::Webhook::FollowEvent
      user_id = event.source.user_id
      token = SecureRandom.alphanumeric(15)
      LineBotToken.create(line_user_id: user_id, token: token)
      request = Line::Bot::V2::MessagingApi::PushMessageRequest.new(
        to: user_id,
        messages: [
          Line::Bot::V2::MessagingApi::TextMessage.new(
            text: "下記URLよりLINE連携を行ってください。\n※連携を行わない場合、リマインド通知はお届けできませんので、ご注意ください。\n\nhttps://fridgebell.jp/line_bots/new?state=#{token}&openExternalBrowser=1"
          )
        ]
      )
      response, status_code, headers = LINE_CLIENT.push_message_with_http_info(
        push_message_request: request
      )
      Rails.logger.info("[LINE Webhook] status: #{status_code} headers: #{headers.inspect} body: #{response.inspect}")
    end
  end
end
