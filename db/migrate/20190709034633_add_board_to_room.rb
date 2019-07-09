class AddBoardToRoom < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :board, :text, array:true
  end
end
