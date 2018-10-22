# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require 'mongoid/fixtures/version'

Gem::Specification.new do |s|
  s.license     = 'MIT'
  s.name        = 'mongoid-fixtures'
  s.version     = Mongoid::Fixtures::VERSION
  s.authors     = ['John Dilts', 'Geoffroy Planquart']
  s.email       = ['hybridindie@gmail.com','geoffroy@planquart.fr']
  s.homepage    = 'https://github.com/hybridindie/mongoid-fixtures'
  s.summary     = 'Fixtures for Mongoid'
  s.description = 'Let you use fixtures with Mongoid the same way you did with ActiveRecord'

  s.files       = Dir['{lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.test_files  = Dir['test/**/*']

  s.add_dependency 'mongoid',       '>= 7.0'
  s.add_dependency 'activesupport', '>= 5.0'
end

