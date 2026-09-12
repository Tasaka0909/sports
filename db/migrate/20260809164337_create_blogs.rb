class CreateBlogs < ActiveRecord::Migration[7.2]
  def change
    create_table :blogs do |f|
      f.string :category
      f.integer :time
      f.text :comment

      f.timestamps
    end
  end
end
