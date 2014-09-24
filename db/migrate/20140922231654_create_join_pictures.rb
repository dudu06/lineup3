class CreateJoinPictures < ActiveRecord::Migration
  def change
    create_table :join_pictures do |t|
      t.references :customer, index: true
      t.references :barber, index: true
      t.references :picture, index: true

      t.timestamps
    end
  end
end
