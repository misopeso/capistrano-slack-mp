namespace :deploy do
  namespace :nofity do
    desc 'Send a deployment notification to Slack.'
    task :slack do
      slack_token = fetch(:slack_token)
      slack_username = fetch(:slack_username, 'capistranobot')
      slack_channel = fetch(:slack_channel, '#general')
      slack_team = fetch(:slack_team)

      deployer = ENV['GIT_AUTHOR_NAME'] || `git config user.name`.chomp
      deployed_stage = fetch(:stage, 'production')

      message = "#{deployer} deployed #{application} successfully to #{deployed_stage}"

      notifier = Capistrano::Slack::Notifier.new(slack_team, slack_token)
      notifier.notify(message, {
        channel: slack_channel,
      })
  end
end