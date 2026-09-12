class AddTimeToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :time, :integer
  end
end
