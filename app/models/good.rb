class Good < ActiveRecord::Base
  belongs_to :category
  has_many :goods_orders
  has_many :orders, through: :goods_orders
end
