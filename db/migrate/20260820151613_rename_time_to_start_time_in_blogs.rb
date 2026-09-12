class RenameTimeToStartTimeInBlogs < ActiveRecord::Migration[7.2]
  def change
    rename_column :blogs, :time, :start_time
  end
end
