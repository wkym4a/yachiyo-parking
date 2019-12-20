class CreateTests < ActiveRecord::Migration[6.0]
  def change
    create_table :tests do |t|
      t.string :cd
      t.string :name

      t.timestamps
    end
  end
end
