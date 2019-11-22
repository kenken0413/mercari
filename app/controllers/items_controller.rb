class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(1)
    @parents = Category.all.order("id ASC").limit(13)
    render "sell.html.haml"if params[:id] == "sell"
    render "item-detail.html.haml" if params[:id] =="detail"
    render "buy-confirmation.html.haml" if params[:id] =="buy"
    # @user= User.find(paramas[:id])
    # (@item = User.item.find(params[:id]))
  end

end
