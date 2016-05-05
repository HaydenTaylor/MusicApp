class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true

  def self.generate_session_token
    SecureRandom.base64
  end

  def reset_session_token!
  end

  def ensure_session_token
  end



end #user class
