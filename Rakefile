require "bundler/gem_tasks"
require "rake/testtask"
require "yard"

desc "generate documentation"
YARD::Rake::YardocTask.new do |t|
  t.files << 'lib/**/*.rb'
end

namespace :test do 
  Rake::TestTask.new(:unit) do |task|
    task.libs << "test"
    task.test_files = FileList["test/unit/**/*_test.rb"]
  end
end

task :test do
  Rake::Task["test:unit"].invoke
end

task :default => [:test, :build, :yard]