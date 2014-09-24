class Picture < ActiveRecord::Base
	has_many :barbers
	has_many :customers
end
