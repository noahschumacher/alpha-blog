class User < ActiveRecord::Base

	# Declaring the 1 to many relationship for User to articles
	has_many :articles

	# takes the email value and makes it downcase before saving to db
	before_save {self.email = email.downcase}

	# Ensures that username is present, unique, within set length
	validates :username,
		presence: true,
		uniqueness: {case_sensative: false},
		length: {minimum: 3, maximum: 25}

	# Regular expression for email structure 
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	# Ensures email is present, unique, valid length, email format
	validates :email,
		presence: true,
		uniqueness: {case_sensative: false},
		length: {maximum: 105},
		format: {with: VALID_EMAIL_REGEX}

	# Validating password
	has_secure_password
end