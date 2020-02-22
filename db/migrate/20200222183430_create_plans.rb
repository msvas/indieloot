class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.string :name
      t.text :description
      t.integer :tier_one_games
      t.integer :tier_two_games
      t.integer :tier_three_games
      t.float :price
      t.float :discounted_price
    end
  end
end
