 

class Article < ActiveRecord::Base

	# Adding the article belonging to one user relation
	belongs_to :user

	# Adding an assurance that an article entered is not all nil, length
	validates :title, presence: true, length: { minimum: 3, maximum: 50 }
	validates :description, presence: true, length: {minimum: 10, maximum: 300}
	validates :user_id, presence: true

end

