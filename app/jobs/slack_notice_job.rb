class SlackNoticeJob < ApplicationJob
  queue_as :default

  WEBHOOK_URL = Rails.application.config.slack_webhook_url.freeze

  def perform(*args)
    notifier = Slack::Notifier.new WEBHOOK_URL do
      defaults channle: '#random', username: 'notifier'
    end

    notifier.ping 'Hello!!'
  end
end
