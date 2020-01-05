class ChangeUserDef < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :lat, from: 0, to: 35.69962509328988
    change_column_default :users, :lon, from: 0, to: 140.08954485427356
  end
end
