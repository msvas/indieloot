class Game < ApplicationRecord
  has_many :keys
  has_and_belongs_to_many :users, join_table: "users_games"
end
