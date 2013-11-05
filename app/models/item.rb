class Item < ActiveRecord::Base
  belongs_to :category
  validates :description, presence: true
  validates :name, presence: true
end
