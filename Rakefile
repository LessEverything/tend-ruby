require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = "test/models/*_test.rb"
end

desc "Run tests"
task :default => :test

