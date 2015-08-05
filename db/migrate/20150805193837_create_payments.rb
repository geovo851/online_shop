class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :type_of_payment

      t.timestamps null: false
    end
  end
end
