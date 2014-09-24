class AddBioToBarbers < ActiveRecord::Migration
  def change
  	add_column :barbers, :bio, :string
  end
end
