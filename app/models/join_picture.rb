class JoinPicture < ActiveRecord::Base
  belongs_to :customer
  belongs_to :barber
  belongs_to :picture
end
