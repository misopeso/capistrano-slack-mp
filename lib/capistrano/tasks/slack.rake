require 'capistrano/slack/notifier'

namespace :deploy do
  namespace :notify do
    desc 'Send a deployment notification to Slack.'
    task :slack do
      run_locally do
        slack_token = fetch(:slack_token)
        slack_username = fetch(:slack_username)
        slack_channel = fetch(:slack_channel)
        slack_team = fetch(:slack_team)

        if slack_token.nil? || slack_team.nil?
          error ":slack_token and :slack_team are required."
        else
          application = fetch(:application)
          branch = fetch(:branch)
          stage = fetch(:stage, :production)

          message = "#{application}(branch: #{branch}) has deployed successfully to #{stage} by #{local_user}"

          options = {}
          options[:channel] = slack_channel unless slack_channel.nil?
          options[:username] = slack_username unless slack_username.nil?

          notifier = Capistrano::Slack::Notifier.new(slack_team, slack_token)
          notifier.notify(message, options)

          info "Send notification message to Slack."
        end
      end
    end
  end
end

after 'deploy:finished', 'deploy:notify:slack'