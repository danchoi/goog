# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "goog"
  s.version     = '0.0.2'
  s.platform    = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9.0'

  s.authors     = ["Daniel Choi"]
  s.email       = ["dhchoi@gmail.com"]
  s.homepage    = "https://github.com/danchoi/goog"
  s.summary     = %q{Simple command line interface to Google search}
  s.description = s.summary

  s.rubyforge_project = "goog"

  s.files         = ['bin/goog']
  s.executables   = ['goog']
  # s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  # s.require_paths = ["lib"]
  s.add_dependency "nokogiri"

end

