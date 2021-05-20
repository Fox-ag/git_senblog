class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :extraversion, :integer
    add_column :users, :agreeableness, :integer
    add_column :users, :openness, :integer
    add_column :users, :conscientiousness, :integer
    add_column :users, :neuroticism, :integer
  end
end
