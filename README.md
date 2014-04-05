# Capistrano::Slack

Slack notification for Capistrano v3.

## Installation

Add this line to your application's Gemfile:

    gem 'capistrano-slack-mp'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-slack-mp

## Usage

    # Capfile
    require 'capistrano/slack'

Please note that any `require` should be placed in `Capfile`, not `config/deploy.rb`.

    # config/deploy.rb
    set :slack_team, 'your team' # Required
    set :slack_token, 'your token' # Required

    set :slack_channel, '#general' # Optional
    set :slack_username, 'capistranobot' # Optional

You need to add the integration in Slack. You should check out the [Slack Incoming WebHooks documentation](https://my.slack.com/services/new/incoming-webhook) for finding out parameters.

`:slack_channel` and `:slack_username` are optional. If you do not specify, these parameters are used Slack integration settings.

## Contributing

1. Fork it ( http://github.com/misopeso/capistrano-slack-mp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
