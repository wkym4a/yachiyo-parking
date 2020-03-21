class ChangeParkingMemo < ActiveRecord::Migration[6.0]
  def up
    change_column :parkings, :memo, :text
  end

  def down
    change_column :parkings, :memo, :string
  end

end
