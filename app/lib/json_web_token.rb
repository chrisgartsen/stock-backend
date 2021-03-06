require 'jwt'

class JsonWebToken

  def self.encode(payload)
    payload.reverse_merge!(meta)
    code = JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
  
  def self.decode(payload)
    JWT.decode(payload, Rails.application.secrets.secret_key_base)
  end

  def self.valid_payload(payload)
    if expired(payload) || payload['iss'] != meta[:iss] || payload['aud'] != meta[:aud]
      return false
    else
      return true
    end
  end

  def self.expired(payload)
    Time.at(payload['exp']) < Time.now
  end

  def self.meta
    {
      exp: 7.days.from_now.to_i,
      iss: 'issuer_name',
      aud: 'client',
    }
  end

end