# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib/chef/handler', __FILE__)

require 'chef_profiler'

Gem::Specification.new do |s|
  s.name = 'profiling-chef-handler'
  s.version = Chef::Handler::Profiler::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ['Joe Miller', 'Andy Glick']
  s.email = ['andyglick@gmail.com']
  s.homepage = 'https://github.com/andyglick/profiling-chef-handler'
  s.summary = 'Chef Profiler Handler'
  s.description = 'Report on the run time of cookbooks, recipes, and resources'
  s.files = %w(LICENSE README.md) + Dir.glob('lib/**/*')
  s.require_paths = ['lib']
  s.add_development_dependency "chef", "> 10.14"
end
