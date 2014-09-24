class AddPicturenameToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :picturename, :string
  end
end
