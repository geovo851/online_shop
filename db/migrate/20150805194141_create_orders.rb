class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user, index: true, foreign_key: true
      t.string :status
      t.text :delivery_adress
      t.references :payment, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
