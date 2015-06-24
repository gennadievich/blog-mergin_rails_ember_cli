class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.find_or_create_for_google_oauth2(access_token, signed_in_resource = nil)
    data = access_token.info
    User.where(email: data["email"]).first_or_create(
      name: data["name"],
      email: data["email"],
      password: Devise.friendly_token[0,20]
    )
  end
end
