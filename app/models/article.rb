

class Article < ActiveRecord::Base
	# Adding an assurance that an article entered is not all nil, length
	validates :title, presence: true, length: { minimum: 3, maximum: 50 }
	validates :description, presence: true, length: {minimum: 10, maximum: 300}


end

