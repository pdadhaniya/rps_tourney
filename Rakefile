require 'active_record_tasks'

ActiveRecordTasks.configure do |config|
  config.db_dir = 'db'
  config.db_config_path = 'db/config.yml'
  config.env = 'test'
end

ActiveRecordTasks.load_tasks


task :console do
  require '.lib/tourney.rb'
  require 'irb'
  ARGV.clear
  IRB.start
end