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
end
