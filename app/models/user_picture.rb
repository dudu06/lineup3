class UserPicture < ActiveRecord::Base
	belongs_to :picture 
	belongs_to :customer
	belongs_to :barber
end
