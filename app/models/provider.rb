class Provider < ActiveRecord::Base
  validates :uid, :token, :secret, presence: true
  belongs_to :adie

  def self.create_from_omniauth(auth_hash)
    Provider.create!(
      uid: auth_hash[:uid],
      token: auth_hash[:credentials][:token],
      secret:auth_hash[:credentials][:secret],
      )
    rescue ActiveRecord::RecordInvalid
    nil
  end

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["TWITTER_CLIENT_KEY"]
      config.consumer_secret = ENV["TWITTER_CLIENT_SECRET"]
      config.access_token = self.token
      config.access_token_secret = self.secret
    end
  end
end
