class CreateBarbers < ActiveRecord::Migration
  def change
    create_table :barbers do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.string :address
      t.string :zipcode
      t.float :low_price
      t.float :high_price
      t.string :password_digest

      t.timestamps
    end
  end
end
