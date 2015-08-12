class ChangeColumnAvailableForGoods < ActiveRecord::Migration
  change_column :goods, :available, :boolean, default: false
end
