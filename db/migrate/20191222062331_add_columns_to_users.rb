class AddColumnsToUsers < ActiveRecord::Migration[6.0]

  def up
    add_column :users, :name, :string, default:'',  null: false, limit: 40
    add_column :users, :address, :string, default:'',  null: false, limit: 255

    add_column :users, :lat, :float, default:0,  null: false
    add_column :users, :lon, :float, default:0,  null: false

    add_column :users, :url, :string, default:'',  null: false, limit: 4096
  end

  def down
    remove_column :users, :name, :string
    remove_column :users, :address, :string
    remove_column :users, :lat, :float
    remove_column :users, :lon, :float
    remove_column :users, :url, :string
  end

end
