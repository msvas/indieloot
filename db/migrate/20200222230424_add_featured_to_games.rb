class AddFeaturedToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :featured, :bool, default: false
  end
end
