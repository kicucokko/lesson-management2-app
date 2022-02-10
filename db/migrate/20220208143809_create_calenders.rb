class CreateCalenders < ActiveRecord::Migration[6.0]
  def change
    create_table :calenders do |t|
      t.date "day", null: false
      t.string "time", null: false
      t.bigint "user_id", null: false
      t.datetime "start_time", null: false
      t.index ["user_id"], name: "index_calenders_on_user_id"
      t.timestamps
    end
  end
end
