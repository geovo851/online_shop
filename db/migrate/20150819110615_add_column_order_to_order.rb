class AddColumnOrderToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order, :boolean , default: false
  end
end
