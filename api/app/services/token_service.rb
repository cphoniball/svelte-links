class TokenService
  def self.create(payload)
    JWT.encode(payload, Rails.configuration.jwt_secret, "HS256")
  end

  def self.decode(token)
    JWT.decode(token, Rails.configuration.jwt_secret, true, { algorithm: "HS256" }).first
  end

  def self.valid?(token)
    begin
      decode(token)
      true
    rescue
      false
    end
  end
end
