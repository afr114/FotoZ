class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates_presence_of :username, :message => 'You need a user name to create an account.'
  validates_length_of :username, minimum: 4, maximum: 12, too_short: 'minimum is 4 characters', too_long: 'maximum is 12 characters'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:email]

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end
end
