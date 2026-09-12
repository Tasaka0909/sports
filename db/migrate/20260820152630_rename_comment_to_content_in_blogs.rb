class RenameCommentToContentInBlogs < ActiveRecord::Migration[7.2]
  def change
    rename_column :blogs, :comment, :content
  end
end
