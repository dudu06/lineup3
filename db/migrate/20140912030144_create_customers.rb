class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.string :email
      t.string :address
      t.string :zipcode
      t.string :password_digest
      t.string :profile_pic_file_name
      t.string :profile_pic_content_type
      t.integer :profile_pic_file_size

      t.timestamps
    end
  end
end
