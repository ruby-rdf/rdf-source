#!/usr/bin/env ruby -rubygems
# -*- encoding: utf-8 -*-
$:.unshift File.expand_path('../lib', __FILE__)
require 'rdf/source/version'

GEMSPEC = Gem::Specification.new do |gem|
  gem.version            = RDF::Source::VERSION.to_s
  gem.date               = Time.now.strftime('%Y-%m-%d')

  gem.name               = 'rdf-source'
  gem.homepage           = 'http://rdf.rubyforge.org/'
  gem.license            = 'Public Domain' if gem.respond_to?(:license=)
  gem.description        = 'RDF.rb plugin for easily producing RDF from existing objects'
  gem.summary            = 'RDF.rb plugin for easily producing RDF from existing objects'
  gem.rubyforge_project  = 'rdf-source'

  gem.authors            = ['Ben Lavender']
  gem.email              = 'blavender@gmail.com'

  gem.platform           = Gem::Platform::RUBY
  gem.files              = %w(AUTHORS README UNLICENSE) + Dir.glob('lib/**/*.rb')
  gem.bindir             = %q(bin)
  gem.executables        = %w()
  gem.default_executable = gem.executables.first
  gem.require_paths      = %w(lib)
  gem.extensions         = %w()
  gem.test_files         = %w()
  gem.has_rdoc           = false

  gem.required_ruby_version      = '>= 1.8.6'
  gem.requirements               = []
  gem.add_runtime_dependency     'rdf',      '>= 0.3.3'
  gem.add_development_dependency 'rdf-spec', '>= 0.2.0'
  gem.add_development_dependency 'rspec',    '>= 2.1.0'
  gem.add_development_dependency 'yard' ,    '>= 0.5.3'
  gem.post_install_message       = nil
end
