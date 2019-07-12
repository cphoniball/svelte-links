class User < ApplicationRecord
  has_secure_password

  has_many :link_pages

  # TODO: Add unique constraints to this model

  def token
    TokenService.create({ id: self.id, username: self.username })
  end

  def token_valid?(token)
    begin
      payload = TokenService.decode(token)
      payload["id"] == self.id
    rescue
      false
    end
  end
end
