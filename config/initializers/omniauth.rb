Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['TWITTER_CLIENT_KEY'], ENV['TWITTER_CLIENT_SECRET']
end