class Customer < ActiveRecord::Base

	has_many :haircuts
	has_many :barbers, through: :haircuts 
	has_many :pictures
	  #user profile picture upload using paperclip gem
	has_attached_file :avatar, :styles => { :large => "500x500>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	  #allows users to have multiple pictures
	has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }

	#validations
	validates_attachment :avatar, presence: true, content_type: { content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"] }
	# validates_attachment :picture, presence: true, content_type: { content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"] }

	has_secure_password 
end
