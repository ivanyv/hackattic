require 'rake/testtask'
require 'dotenv/tasks'

Rake::TestTask.new do |t|
  t.pattern = '**/test/*_test.rb'
end

Dir[File.join(File.expand_path('../tasks', __FILE__), '**/*.rake')].each(&method(:load))
