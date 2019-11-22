class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.new
    @parents = Category.all.order("ancestry ASC").limit(13)
    @item1= Item.find(1)

    render "sell.html.haml"if params[:id] == "sell"
    render "item-detail.html.haml" if params[:id] =="detail"
    render "buy-confirmation.html.haml" if params[:id] =="buy"
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    @image = Image.new(image_params)
    # binding.pry

    if @item.save
      redirect_to root_path
    else
      render :sell
    end
    @image.save

  end

private
  def item_params
    params.require(:item).permit(:name, :description, :state, :price, :seller_id, :category_id).merge(seller_id: "1")
  end

  def set_category
    @category = Category.find(1)
  end

  def delivary_params
    params.require(:delivary).permit(:postage_method,:postage_detail)
  end

  def image_params
    params.require(:image).permit(:image).merge(item_id: "1" )
  end

end
