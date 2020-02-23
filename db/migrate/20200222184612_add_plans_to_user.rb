class AddPlansToUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :plan, foreign_key: true
  end
end
