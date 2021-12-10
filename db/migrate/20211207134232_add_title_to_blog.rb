class AddTitleToBlog < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :title, :string
  end
end
