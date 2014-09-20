class CreateHaircuts < ActiveRecord::Migration
  def change
    create_table :haircuts do |t|
      t.integer :customer_id
      t.integer :barber_id
      t.text :review

      t.timestamps
    end
  end
end
