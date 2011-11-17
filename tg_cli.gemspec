# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tg_cli/version"

Gem::Specification.new do |s|
  s.name        = "tg_cli"
  s.version     = TechnoGate::TgCli.version
  s.authors     = ["Wael Nasreddine"]
  s.email       = ["wael.nasreddine@gmail.com"]
  s.homepage    = ""
  s.summary     = "Helpers around Thor extracted from the Vagrant gem."
  s.description = s.summary

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  ####
  # Run-time dependencies
  ####

  # Bundler
  s.add_dependency 'bundler', '~>1.0.0'

  # Thor
  s.add_dependency 'thor', '~>0.14.6'
  
  ####
  # Development dependencies
  ####

  # Guard
  s.add_development_dependency 'guard', '~>0.8.4'
  s.add_development_dependency 'guard-bundler', '~>0.1.3'
  s.add_development_dependency 'guard-rspec', '~>0.4.5'

  # Documentation
  s.add_development_dependency 'yard', '~>0.7.2'

  ####
  # Development / Test dependencies
  ####

  # RSpec / Capybara
  s.add_development_dependency 'rspec', '~>2.6.0'

  # Mocha
  s.add_development_dependency 'mocha', '~>0.10.0'

  ####
  # Debugging
  ####
  s.add_development_dependency 'pry', '~>0.9.6.2'
end
