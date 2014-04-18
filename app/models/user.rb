class User < ActiveRecord::Base
  has_many :log, :dependent=> :destroy
  has_secure_password

  before_save { email.downcase! }
  before_save :create_remember_token

  validates :name,  :presence=> true, :length=> { :maximum=> 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :format=> { :with=> VALID_EMAIL_REGEX },
                    :uniqueness=> { :case_sensitive=> false }
  validates :password, :presence=> true, :length=> { :minimum=> 6 }
  validates :password_confirmation, :presence=> true
  after_validation { self.errors.messages.delete(:password_digest) }

  private
    def create_remember_token
    	self.remember_token = SecureRandom.base64.tr('+/', '-_')
		end

	def self.from_omniauth(auth)
		where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.password = auth.provider
			user.password_confirmation = auth.provider
			user.uid = auth.uid
			user.name = auth.info.name
			user.oauth_token = auth.credentials.token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.save!
		end
	end
end
