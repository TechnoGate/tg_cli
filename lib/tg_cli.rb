begin
  require "bundler/setup"
rescue LoadError
  require "rubygems"
  require "bundler/setup"
end

require "tg_cli/version"
require "tg_cli/main"
require "tg_cli/base"
require "tg_cli/group_base"
