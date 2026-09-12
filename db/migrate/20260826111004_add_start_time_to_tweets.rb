class AddStartTimeToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :start_time, :datetime
  end
end
