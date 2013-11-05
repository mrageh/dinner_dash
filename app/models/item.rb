class Item < ActiveRecord::Base

  validates :description, presence: true
  validates :name,        presence: true


end
