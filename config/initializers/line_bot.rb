require "line-bot-api"

LINE_CLIENT = Line::Bot::V2::MessagingApi::ApiClient.new(
  channel_access_token: Rails.application.credentials.dig(:line_bot, :channel_token)
)

LINE_BLOB_CLIENT = Line::Bot::V2::MessagingApi::ApiBlobClient.new(
  channel_access_token: Rails.application.credentials.dig(:line_bot, :channel_token)
)

LINE_WEBHOOK_PARSER = Line::Bot::V2::WebhookParser.new(
  channel_secret: Rails.application.credentials.dig(:line_bot, :channel_secret)
)
