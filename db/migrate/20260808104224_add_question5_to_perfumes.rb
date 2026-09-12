class AddQuestion5ToPerfumes < ActiveRecord::Migration[7.2]
  def change
    add_column :perfumes, :question5, :string
  end
end
