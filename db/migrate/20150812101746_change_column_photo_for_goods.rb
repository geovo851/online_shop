class ChangeColumnPhotoForGoods < ActiveRecord::Migration
  change_column :goods, :photo, :string
end
