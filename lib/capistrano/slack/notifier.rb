class Capistrano::Slack::Notifier

  attr_reader :team, :token, :notifier

  def initialize(team, token)
    @team = team
    @token = token

    @notifier = Slack::Notifier.new(@team, @token)
  end

  def notify(message, options)
    notifier.ping(message, options)
  end
end
