class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :user_1
      t.string :user_2
      t.string :turn

      t.timestamps
    end
  end
end
