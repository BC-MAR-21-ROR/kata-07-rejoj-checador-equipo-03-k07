# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

RubyCriticSmallBadge.configure do |config|
  config.minimum_score = ENV.fetch('RUBYCRITICLIMIT', 90.0)
  config.output_path = ENV.fetch('RUBYCRITPATH', 'badges/app')
end

RubyCritic::RakeTask.new(:rubycritic) do |task|
  task.options = %(
    --custom-format RubyCriticSmallBadge::Report
    --minimum-score #{RubyCriticSmallBadge.config.minimum_score}
    --format html
    --format console)
  task.paths = FileList['app/**/*.rb']
end

task :sandi_meter do
  pp `sandi_meter -dg -o tmp/sandi_meter`
end

task default: %i[rubycritic sandi_meter]

Rails.application.load_tasks
