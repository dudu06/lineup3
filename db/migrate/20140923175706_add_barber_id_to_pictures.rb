class AddBarberIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :barber_id, :integer
  end
end
