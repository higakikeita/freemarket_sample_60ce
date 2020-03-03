require File.expand_path(File.dirname(__FILE__) + "/environment")

rails_env = Rails.env.to_sym
rails_root = Rails.root.to_s

# environment は設定しないと production になってしまう
set :environment, rails_env
set :output, "#{rails_root}/log/cron.log"

every :weekend do
  runner 'Tasks::Product_task.set_time_sale'
end

every :monday do
  runner 'Tasks::Product_task.end_time_sale'
end