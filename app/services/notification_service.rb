class NotificationService
  def self.call
    new.call
  end

  def call
    send_push_message
  end

  private

  def build_reminder_text(user)
    limit_days = [ user.reminder.days_before.to_i, 7 ].min
    today = Date.current
    limit_date = today + limit_days
    remind_foods = UserFood.includes(:food).where(user_id: user.id).where("deadline_date <= ?", limit_date)

    return nil if remind_foods.blank?

    sections = {
      expired: [],
      today: [],
      in2: [],
      in5: [],
      in7: []
    }

    remind_foods.each do |uf|
      food = uf.food.name
      v = uf.deadline_date
      if v < today
        sections[:expired] << "⚠️#{food}"
      elsif v == today
        sections[:today] << "⚠️#{food}"
      else
        diff = (v - today).to_i
        if diff <= 2
          sections[:in2] << "・#{food} (あと#{diff}日)"
        elsif diff <= 5
          sections[:in5] << "・#{food} (あと#{diff}日)"
        else
          sections[:in7] << "・#{food} (あと#{diff}日)"
        end
      end
    end

    nf = "ありません☺️"
    blocks = []
    blocks << [ "【期限切れ】", (sections[:expired].presence || [ nf ]) ]
    blocks << [ "【今日まで】", (sections[:today].presence || [ nf ]) ]

    if limit_days == 0
      return
    elsif 0 < limit_days && limit_days <= 2
      blocks << [ "【2日以内】", (sections[:in2].presence || [ nf ]) ]
    elsif limit_days <= 5
      blocks << [ "【2日以内】", (sections[:in2].presence || [ nf ]) ]
      blocks << [ "【5日以内】", (sections[:in5].presence || [ nf ]) ]
    else
      blocks << [ "【2日以内】", (sections[:in2].presence || [ nf ]) ]
      blocks << [ "【5日以内】", (sections[:in5].presence || [ nf ]) ]
      blocks << [ "【7日以内】", (sections[:in7].presence || [ nf ]) ]
    end

    text = "📢 食材の期限状況をお知らせ\n"
    text << "￣￣￣￣￣￣￣￣￣￣￣￣￣￣\n"
    text << "✅#{limit_days}日前までの期限状況\n\n"

    blocks.each do |title, items|
      text << "#{title}\n"
      items.each { |i| text << "#{i}\n" }
      text << "\n"
    end
    text.rstrip
  end

  def send_push_message
    remind_users = User.includes(:reminder).where.not(reminders: { id: nil, remind_time: nil })
    time = Time.current
    remind_users.each do |user|
      next unless user.reminder.remind_time.hour == time.hour && user.reminder.remind_time.min == time.min
      text = build_reminder_text(user)
      next if text.blank?
      push_request = Line::Bot::V2::MessagingApi::PushMessageRequest.new(
        to: "Ua160fc3901fa36ebdd6a90f9b9c928c3",
        messages: [
          Line::Bot::V2::MessagingApi::TextMessage.new(
            text: text
          )
        ]
      )
      response, status_code, headers = LINE_CLIENT.push_message_with_http_info(
        push_message_request: push_request
      )
      Rails.logger.info("[LINE push] status: #{status_code} headers: #{headers.inspect} body: #{response.inspect}")
    end
  end
end
