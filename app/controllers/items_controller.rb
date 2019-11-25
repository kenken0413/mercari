class ItemsController < ApplicationController

  def index
    @parents = Category.all.order("ancestry ASC").limit(13)
    
  end

  def show

    @item = Item.new
    @parents = Category.all.order("ancestry ASC").limit(13)
    @item1= Item.find(2)
    # @item1 = Item.find(params[:id])
    @price1 = @item1.price.to_s(:delimited)
    @like1= @item1.likes.count
    @item_next= Item.find(2+1)
    @item_prev= Item.find(2-1)
    # @item2 = Item.find(params[:id]+1)
    # @item0 = Item.find(params[:id]-1)
    @seller_items = @item1.seller.selling_items.order("id DESC").limit(6)

    @comment= Comment.new
    render "sell.html.haml"if params[:id] == "sell"
    render "item-detail.html.haml" if params[:id] =="detail"
    render "buy-confirmation.html.haml" if params[:id] =="buy"
  end

end


# def set_item
#   @item = Item.find(params[:id])
# end
