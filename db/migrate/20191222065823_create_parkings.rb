class CreateParkings < ActiveRecord::Migration[6.0]
  def change
    create_table :parkings do |t|
      t.string :symbol , null: false , limit: 2
      t.string :name , null: false , limit: 40
      t.string :address , null: false , limit: 255
      t.float :lat , null: false
      t.float :lon , null: false
      t.integer :price , null: false
      t.string :memo , null: false, limit: 400
      t.text :managing_memo , null: false , limit: 800
      t.integer :number , null: false
      t.integer :empty_number , null: false
      t.integer :status , null: false , limit: 1
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
