class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true

  validates( :password, length: {minimum: 6, allow_nil: true} )


  after_initialize :ensure_session_token

  attr_reader :password

  def self.generate_session_token
    SecureRandom.base64
  end

  def self.is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
    #might need to be self.password_digest
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    return user if User.is_password?(password)
    nil
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
    self.session_token
    # session[session_token] = self.session_token
    # do I need to set the session[session_token] here?
  end

  def ensure_session_token
    self.session_token ||= SecureRandom.base64
    # again, need to set session_token in cookies?
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end





end #user class
