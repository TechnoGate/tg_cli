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
  s.add_dependency 'bundler', '>=1.0.0'

  # Thor
  s.add_dependency 'thor', '~>0.14.6'

  ####
  # Development dependencies
  ####

  # Guard
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-bundler'
  s.add_development_dependency 'guard-rspec'

  # Documentation
  s.add_development_dependency 'yard'

  ####
  # Development / Test dependencies
  ####

  # RSpec / Capybara
  s.add_development_dependency 'rspec', '~>2.6.0'

  # Mocha
  s.add_development_dependency 'mocha'

  # Rake
  s.add_development_dependency 'rake'

  ####
  # Debugging
  ####
  s.add_development_dependency 'pry'
end
