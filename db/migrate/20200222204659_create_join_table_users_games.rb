class CreateJoinTableUsersGames < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :games, table_name: :users_games do |t|

    end
  end
end
