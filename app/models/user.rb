class User < ApplicationRecord
  has_many :blogs
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :lockable, :recoverable, :rememberable, :validatable, 
         :omniauthable, :omniauth_providers => [:google_oauth2]

  validates :name, presence: true, uniqueness: true

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    # unless user
    #     user = User.create(name: data['name'],
    #        email: data['email'],
    #        password: Devise.friendly_token[0,20]
    #     )
    # end
    user
  end
end
