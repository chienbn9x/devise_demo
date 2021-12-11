class User < ApplicationRecord
  has_many :blogs
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable,
         :lockable, :recoverable, :rememberable, :validatable, 
         :omniauthable, :omniauth_providers => [:google_oauth2]

  validates :name, presence: true, uniqueness: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
    end
 end
end
