class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.text :name
      t.binary :photo
      t.text :description
      t.references :category, index: true, foreign_key: true
      t.float :price
      t.boolean :available

      t.timestamps null: false
    end
  end
end
