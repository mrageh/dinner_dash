class Item < ActiveRecord::Base
  belongs_to :category
  validates :description, :name, presence: true
  validates :price, numericality: { greater_than: 0}
end
