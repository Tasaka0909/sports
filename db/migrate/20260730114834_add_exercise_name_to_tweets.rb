class AddExerciseNameToTweets < ActiveRecord::Migration[7.2]
  def change
    add_column :tweets, :exercise_name, :string
  end
end
