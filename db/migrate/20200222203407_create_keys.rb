class CreateKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :keys do |t|
      t.string :encrypted_key
      t.integer :status
      t.datetime :given_date
      t.timestamps null: false

      t.references :games, foreign_key: true
      t.references :users, foreign_key: true
    end
  end
end
