class Order < ActiveRecord::Base
  has_many :order_items
  has_many :items, through: :order_items
  belongs_to :user

  def quantity_of_item(item)
    order_items.where(item_id: item.id).first.quantity
  end

  def total
    sum = 0
    items.all.each do |item|
      sum += item.price * quantity_of_item(item)
    end
    sum
  end

end
