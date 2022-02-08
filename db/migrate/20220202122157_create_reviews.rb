class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.datetime :time, null: false
      t.string :title
      t.text :text, null: false
      t.string :home_work, null: false
      t.string :information
      t.references :user, null: false,foreign_key: true
      t.references :lesson_room,   null: false, foreign_key: true 
      t.timestamps
    end
  end
end
