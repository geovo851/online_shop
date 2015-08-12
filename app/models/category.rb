class Category < ActiveRecord::Base
  has_many :goods
  validates :category, presence: true
end
