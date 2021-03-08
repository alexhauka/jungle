class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: true, uniqueness: true, case_sensitive: false
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 6 }

  before_save { self.email.downcase!}

  def self.authenticate_with_credentials email, password_digest
    @user = User.find_by_email(email.strip.downcase)
    if @user && @user.authenticate(password_digest)
      @user
    else  
      nil
    end
  end


end
