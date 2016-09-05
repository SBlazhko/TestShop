class Category < ApplicationRecord

	has_many :products
	belongs_to :user

	validates :title, presence: true, length: {minimum: 2, maximum: 15}
	
end
