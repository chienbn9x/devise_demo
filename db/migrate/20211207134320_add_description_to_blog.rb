class AddDescriptionToBlog < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :description, :string
  end
end
