require "bundler/gem_tasks"
require "rake/testtask"
require "yard"

TEST_SUITES = [ { :name => "rack", :desc => "rack tests", :pattern => "test/rack/**/*_test.rb"} ]

desc "generate documentation"
YARD::Rake::YardocTask.new do |t|
  t.files << 'lib/**/*.rb'
end

namespace :test do 
  Rake::TestTask.new(:rack) do |task|
    task.libs << "test"
    task.test_files = FileList["test/rack/**/*_test.rb"]
  end
end

task :test do
  Rake::Task["test:rack"].invoke
end

task :default => [:test, :build, :yard]