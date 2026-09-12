class AddOtherToTweet < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :other, :text
  end
end
