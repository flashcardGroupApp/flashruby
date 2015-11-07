class User < ActiveRecord::Base
  has_secure_password

  before_validation :ensure_access_token!

  has_many :decks
  has_many :guesses

  validates_presence_of :username
  validates_uniqueness_of :email, :username
  validates_format_of :email, with: /.+@.+\..+/
  validates :auth_token, presence: true, uniqueness: true

  def ensure_access_token!
    if self.auth_token.blank?
      self.auth_token = User.generate_token
    end
  end

  def self.generate_token
    token = SecureRandom.hex
    while User.exists?(auth_token: token)
      token = SecureRandom.hex
    end
    token
  end
end
