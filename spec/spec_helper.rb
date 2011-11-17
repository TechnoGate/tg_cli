# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'rspec'
require 'tg_cli'

include TechnoGate
include TgCli

RSpec.configure do |config|
  def config.escaped_path(*parts)
    Regexp.compile(parts.join('[\\\/]'))
  end unless config.respond_to? :escaped_path

  # == Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr
  # config.mock_with :rspec
end

# Include support files.
Dir["#{File.expand_path('../', __FILE__)}/support/**/*.rb"].each { |f| require f }
