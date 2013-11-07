class Item < ActiveRecord::Base
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  validates :description, :name, presence: true
  validates :price, numericality: { greater_than: 0}
end
