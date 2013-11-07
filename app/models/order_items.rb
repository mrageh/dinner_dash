class OrderItems < ActiveRecord::Base
  belongs_to :orders
  belongs_to :items
end
