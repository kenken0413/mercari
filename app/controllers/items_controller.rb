class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @parents = Category.all.order("ancestry ASC").limit(13)
    @popular_categories = Category.find(1,200,898,685)
    
    @all_brands = Brand.all
    @popular_brands = Brand.find(2447,3813,4818,1854)
    
    @lady_items = Item.where(category_id: 1).limit(10).order(id: "DESC")
    @man_items = Item.where(category_id: 200).limit(10).order(id: "DESC")
    @electronic_items = Item.where(category_id: 898).limit(10).order(id: "DESC")
    @toy_items = Item.where(category_id: 685).limit(10).order(id: "DESC")
    @chanel_items = Item.where(brand_id: 2447).limit(10).order(id: "DESC")
    @nike_items = Item.where(brand_id: 3813).limit(10).order(id: "DESC")
    @gucci_items = Item.where(brand_id: 4818).limit(10).order(id: "DESC")
    @prada_items = Item.where(brand_id: 1854).limit(10).order(id: "DESC")
  end

  def show
    @item = Item.new
    @image = Image.new
    @delivery = Delivery.new
    
    @parents = Category.all.order("ancestry ASC").limit(13)
    @popular_brands = Brand.find(2447,3813,4818,1854,219)
    @all_brands = Brand.all
    @popular_brands = Brand.find(2447,3813,4818,1854,219)

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
    # @user= User.find(paramas[:id])
    # (@item = Item.find(params[:id]))
  end

  def new
  end

  def create
    @item = Item.new(item_params)
    @image = Image.new(image_params)
    @delivery = Delivery.new(delivery_params)

    if @item.save
      redirect_to root_path
    else
      render :sell
    end

    @delivery.save
    @image.save

    # if @image.save
    #   render json: { message: "success", fileID: @image.id }, :status => 200
    # else
    #   render json: { error: @image.errors.full_messages.join(',')}, :status => 400
    # end

  end

private

# user.idは全て１を仮入力しているため、修正が必要

  def item_params
    params.require(:item).permit(:name, :description, :state_id, :price, :seller_id, :category_id).merge(seller_id: "1")
  end

  def set_category
    @category = Category.find(1)
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
