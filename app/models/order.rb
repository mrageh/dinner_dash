class Order < ActiveRecord::Base
  has_many :order_items
  has_many :items, through: :order_items

  def order_names_and_description
    order.items.all
  end

end
