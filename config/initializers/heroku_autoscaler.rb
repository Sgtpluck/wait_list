HerokuResqueAutoscaler.configure do |config|
  config.heroku_api_key  = ENV["HEROKU_API_KEY"]
  config.heroku_app_name = ENV["HEROKU_APP_NAME"]
end