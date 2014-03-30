# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/slack/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-slack-mp"
  spec.version       = Capistrano::Slack::Version::STRING
  spec.authors       = ["URAMOTO Kazunori"]
  spec.email         = ["kuprij@mac.com"]
  spec.summary       = %q{Capistrano integration for Slack.}
  spec.description   = %q{Capistrano integration for Slack.}
  spec.homepage      = "https://github.com/misopeso/capistrano-slack-mp"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'capistrano', '>= 3.0.0'
  spec.add_runtime_dependency 'slack-notifier'

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
