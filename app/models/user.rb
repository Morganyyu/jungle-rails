class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, presence: true, :confirmation => true, length: { minimum: 5 }
  validates_confirmation_of :password
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    proper_email = email.strip.downcase
    user = User.find_by_email(proper_email)
    if user && user.authenticate(password)
      # @user = user
      return user
    else
      return nil
    end
  end

end
