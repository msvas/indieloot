class CreateKeys < ActiveRecord::Migration[5.2]
  def change
    create_table :keys do |t|
      t.string :encrypted_key
      t.integer :status
      t.datetime :given_date
      t.timestamps null: false

      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end
