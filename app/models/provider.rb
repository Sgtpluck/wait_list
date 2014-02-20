class Provider < ActiveRecord::Base

  def self.find_or_create_from_omniauth(auth_hash)
    Provider.find_by(uid: auth_hash[:uid]) || create_from_omniauth(auth_hash)
  end

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
