class AddCustomertypeToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :customertype, :string
  end
end
