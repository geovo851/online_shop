class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :payment
  has_many :goods_orders
  has_many :goods, through: :goods_orders
end
