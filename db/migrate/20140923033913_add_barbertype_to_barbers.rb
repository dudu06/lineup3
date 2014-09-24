class AddBarbertypeToBarbers < ActiveRecord::Migration
  def change
    add_column :barbers, :barbertype, :string
  end
end
