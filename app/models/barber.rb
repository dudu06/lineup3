class Barber < ActiveRecord::Base

	has_many :haircuts
	has_many :customers, through: :haircuts

	has_attached_file :avatar, :styles => { :large => "500x500>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

	#validations
	validates_attachment :avatar, presence: true, content_type: { content_type: ["image/jpeg", "image/jpg", "image/gif", "image/png"] }

	has_secure_password 
end
