require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake'
require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :default => :test_rubies

desc "Runs tests on Ruby 1.8.7 and 1.9.2"
task :test_rubies do
  system "rvm 1.8.7@constant-redefinition_gem,1.9.2@constant-redefinition_gem,1.9.3@constant-redefinition_gem do rake test"
end
