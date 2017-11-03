class SlackNoticeJob < ApplicationJob
  queue_as :default

  WEBHOOK_URL = Rails.application.config.slack_webhook_url.freeze

  def perform(channel, username, message)
    notifier = Slack::Notifier.new WEBHOOK_URL do
      defaults channel: "##{channel}", username: username
    end

    notifier.ping message.to_s
  end
end
