# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "low_voltage/version"

Gem::Specification.new do |s|
  s.name        = "low_voltage"
  s.version     = LowVoltage::VERSION
  s.authors     = ["Adam Michel"]
  s.email       = ["awmichel90@gmail.com"]
  s.homepage    = "http://amichel.me"
  s.summary     = %q{Uses concepts from High Voltage for powering a file based blog in Rails.}
  s.description = %q{Building off High Voltage, Low Voltage allows you to have a file based blog in your Rails app.}

  s.rubyforge_project = "low_voltage"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.add_dependency("high_voltage", ">= 1.2.0")
  s.add_dependency("metadown", ">= 1.0.1")
  s.add_development_dependency("rake")
end
