# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

if Rails.env.development?
  require 'rubycritic_small_badge'
  require 'rubycritic/rake_task'
  require 'sandi_meter/file_scanner'

  { spec: 65, app: 90 }.each do |dir, percentage|
    RubyCriticSmallBadge.configure do |config|
      config.minimum_score = percentage
    end

    RubyCritic::RakeTask.new("rubycritic:#{dir}") do |task|
      task.options = %(
        --custom-format RubyCriticSmallBadge::Report
        --minimum-score #{RubyCriticSmallBadge.config.minimum_score}
        --format html
        --path tmp/rubycritic/#{dir}
        --format console
      )
      task.paths = FileList["#{dir}/**/*.rb"]
    end
  end

  task :sandi_meter do
    pp `sandi_meter -dg -o tmp/sandi_meter`
  end

  task default: %i[rubycritic:app rubycritic:spec sandi_meter]
end
Rails.application.load_tasks
