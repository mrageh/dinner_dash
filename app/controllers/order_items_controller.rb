class OrderItemsController < ApplicationController

  def create
    order = find_or_create_order
    order_item = order.order_items.new
    order_item.item_id = params[:order_item][:item_id]
    order_item.quantity = params[:quantity]

    item = Item.find(params[:order_item][:item_id])
    if order_item.save
      flash.notice = "Added #{order_item.quantity} #{item.name.pluralize( order_item.quantity)} to your cart."
      redirect_to categories_path
    end
  end

  def destroy
    item_to_delete = OrderItems.find(params[:id])
      
    item_to_delete.destroy
    redirect_to order_path(current_order)
  end

end
