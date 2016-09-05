class Product < ApplicationRecord

	belongs_to :category
	belongs_to :user

	validates :name, presence: true, length: {minimum: 2, maximum: 30}
	validates :description, length: {maximum: 200}

	has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/missing.jpeg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
