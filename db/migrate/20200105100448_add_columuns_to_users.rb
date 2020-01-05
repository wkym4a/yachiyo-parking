class AddColumunsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tel, :string, default:'',  null: false, limit: 20
    add_column :users, :fax, :string, default:'',  null: false, limit: 20
    add_column :users, :memo, :text, default:'',  null: false, limit: 400
  end
end
