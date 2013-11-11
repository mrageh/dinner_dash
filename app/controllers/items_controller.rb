class ItemsController < ApplicationController
  # before_action :authorize, :except => [:index]

  include ItemsHelper

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save

    redirect_to items_path
  end
end
