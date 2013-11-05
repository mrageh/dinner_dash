class Item < ActiveRecord::Base
  belongs_to :category
  validates :description, presence: true
  validates :name, presence: true
  validates :price, numericality: { greater_than: 0}
end
