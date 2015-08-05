class CreateGoodsOrders < ActiveRecord::Migration
  def change
    create_table :goods_orders do |t|
      t.references :order, index: true, foreign_key: true
      t.references :good, index: true, foreign_key: true
      t.float :count
      t.float :price

      t.timestamps null: false
    end
  end
end
