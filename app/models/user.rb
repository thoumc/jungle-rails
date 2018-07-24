class User < ActiveRecord::Base
  before_save { self.email.downcase! }
  :authenticate_with_credentials


  has_secure_password
  has_many :reviews

  validates_uniqueness_of :email,  :case_sensitive => false
  validates :email, presence: true
  validates :first_name, :last_name, presence: true
  validates :password_confirmation, presence: true
  validates :password_digest, presence: true
  validates :password, length: {minimum: 4}

def self.authenticate_with_credentials(email, password)
  email.downcase!
  user = User.find_by_email(email.strip)
  return user && user.authenticate(password)
end


end
