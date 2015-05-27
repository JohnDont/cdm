class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  enum gender: [ :male, :female ]

  mount_uploader :avatar, AvatarUploader

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      # If not set will make user to go to signup process and fill his password
      # user.password = Devise.friendly_token[0,20]
      user.provider = auth.provider
      user.uid = auth.uid
      user.full_name = auth.info.name
      user.gender = auth.extra.raw_info.gender
      user.remote_avatar_url = auth.info.image.gsub('http://','https://')
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      auth = session["devise.facebook_data"]
      if data = auth && auth["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
        user.provider = auth["provider"]
        user.uid = auth["uid"]
        user.full_name = data["name"] if user.full_name.blank?
        user.gender = data["gender"] if user.gender.blank?
        user.remote_avatar_url = auth["info"]["image"].gsub('http://','https://')
      end
    end
  end
end
