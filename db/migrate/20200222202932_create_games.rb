class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.string :genre
      t.integer :tier
      t.float :steam_price
      t.float :base_price
    end
  end
end
