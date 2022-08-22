class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page]).per(8)
    @items_all = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  
end

private
    def item_params
      params.require(:item).permit(:name, :genre_id, :introduction, :price, :is_active, :image)
    end