class AddCalorieToTweet < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :calorie, :string
  end
end
