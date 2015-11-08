class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.integer :card_id
      t.integer :user_id
      t.integer :duration
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
