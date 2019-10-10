class User < ApplicationRecord

	# name validation
	validates :name,  presence: true, length: { maximum: 50 }

	# email validation
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, 
										format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	before_save { self.email = email.downcase }

	# password validation
	has_secure_password
	validates :password, presence: true, length: { minimum: 6 }
end
