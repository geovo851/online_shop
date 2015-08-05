class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :name
      t.string :email
      t.text :adress
      t.text :role

      t.timestamps null: false
    end
  end
end
