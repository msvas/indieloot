class Key < ApplicationRecord
  belongs_to :game
  belongs_to :user

  enum status: {unredeemed: 0, redeemed: 1}
end
