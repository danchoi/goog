# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "goog"
  s.version     = '0.0.1'
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.0'

  s.authors     = ["Daniel Choi"]
  s.email       = ["dhchoi@gmail.com"]
  s.homepage    = "http://danielchoi.com/software/goog.html"
  s.summary     = %q{A command line  interface to Google search}
  s.description = s.summary

  s.rubyforge_project = "goog"

  s.files         = ['bin/goog']
  s.executables   = ['goog']
  # s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  # s.require_paths = ["lib"]

end

