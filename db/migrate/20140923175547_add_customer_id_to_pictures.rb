class AddCustomerIdToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :customer_id, :integer
  end
end
