require 'bcrypt'
module TokenAuthenticatable
  extend ActiveSupport::Concern

  TOKEN_LENGTH = 32

  def refresh_token
    token = Devise.friendly_token(TOKEN_LENGTH)
    encrypted_token = BCrypt::Password.create(token)

    update(authentication_token: encrypted_token)

    { token:, email: }
  end

  def token_match?(token)
    BCrypt::Password.new(authentication_token) == token
  end
end
