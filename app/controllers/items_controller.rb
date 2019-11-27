class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @parents = Category.all.order("ancestry ASC").limit(13)
    
  end

  def new
    @item = Item.new
    @delivery = Delivery.new
    @image = Image.new
    # カテゴリーの親要素を呼び出し
    @parents = Category.all.order("ancestry ASC").limit(13)
  end

  def edit
    @item = Item.new
    @delivery = Delivery.new
    @image = Image.new
    @parents = Category.all.order("ancestry ASC").limit(13)    
  end

  def show
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
    render "item-detail.html.haml" if params[:id] =="detail"
    render "buy-confirmation.html.haml" if params[:id] =="buy"
    # @user= User.find(paramas[:id])
    # (@item = Item.find(params[:id]))
  end

  def create
    @item = Item.new(item_params)
    @image = Image.new(image_params)
    @delivery = Delivery.new(delivery_params)

    @item.save
    # @image.save  

    if  @delivery.save
      redirect_to root_path
    else
      render :sell
    end
    
  end

  # 子を取得
  def category_children
    @children = Category.find("#{params[:parent_id]}").children
  end
  
  # 孫を取得
  def category_grandchildren
    @grandchildren = Category.find("#{params[:child_id]}").children
  end

private
# user.idは全て１を仮入力しているため、修正が必要
  def item_params
    params.require(:item).permit(:name, :description, :state_id, :price, :seller_id, :category_id).merge(seller_id: "1")
  end

  def delivery_params
    params.require(:delivery).permit(:postage_method_id,:postage_detail_id,:prefecture_id,:shipping_date_id).merge(item_id: "1")
  end

  def image_params
    params.require(:image).permit(:image).merge(item_id:"1" )
  end
end


# def set_item
#   @item = Item.find(params[:id])
# end