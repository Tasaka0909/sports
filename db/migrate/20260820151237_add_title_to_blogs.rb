class AddTitleToBlogs < ActiveRecord::Migration[7.2]
  def change
    add_column :blogs, :title, :string
  end
end
