class User < ApplicationRecord
  has_secure_password

  has_many :link_pages

  # TODO: Add unique constraints to this model

  # TODO: Move this token logic out to a different class/service object
  def token
    JWT.encode({ id: self.id, username: self.username }, Rails.configuration.jwt_secret, 'HS256')
  end

  def decode_token(token)
    JWT.decode token, Rails.configuration.jwt_secret, true, { algorithm: 'HS256' }
  end

  def token_valid?(token)
    begin
      decode(token)
      true
    rescue => exception
      false
    end
  end
end
