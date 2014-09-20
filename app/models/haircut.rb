class Haircut < ActiveRecord::Base
	belongs_to :barber, foreign_key: :barber_id
	belongs_to :customer, foreign_key: :customer_id

	validates :review, presence: true,
						 length: { minimum: 3 }

	validates :customer_id, presence: true
	validates :barber_id,   presence: true

end
