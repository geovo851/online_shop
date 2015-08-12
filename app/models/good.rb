class Good < ActiveRecord::Base
  belongs_to :category
  has_many :goods_orders
  has_many :orders, through: :goods_orders
  mount_uploader :photo, ImageUploader
  validates :name, :category_id, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
