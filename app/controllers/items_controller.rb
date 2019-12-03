class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @parents = Category.all.order("ancestry ASC").limit(13)
    @popular_categories = Category.find(1,200,898,685)
    
    @all_brands = Brand.all
    @popular_brands = Brand.find(2447,3813,4818,1854)
    @lady_items = Item.where(category_id: 0..199).order(id: "DESC").limit(10)
    @man_items = Item.where(category_id: 200..345).limit(10).order(id: "DESC")
    @electronic_items = Item.where(category_id: 898..983).limit(10).order(id: "DESC")
    @toy_items = Item.where(category_id: 685..797).limit(10).order(id: "DESC")
    @chanel_items = Item.where(brand_id: 2447).limit(10).order(id: "DESC")
    @nike_items = Item.where(brand_id: 3813).limit(10).order(id: "DESC")
    @gucci_items = Item.where(brand_id: 4818).limit(10).order(id: "DESC")
    @prada_items = Item.where(brand_id: 1854).limit(10).order(id: "DESC")

  end

  def new
    @item = Item.new
    @item.images.build

    # カテゴリーの親要素を呼び出し
    @parents = Category.all.order("ancestry ASC").limit(13)
  end

  def edit
    @item = Item.find(params[:id])
    @delivery = Delivery.find(params[:item_id])
    @image = Image.find(params[:id])
    @parents = Category.all.order("ancestry ASC").limit(13)    
  end

  def show
    @parents = Category.all.order("ancestry ASC").limit(13)
    @popular_brands = Brand.find(2447,3813,4818,1854,219)
    @all_brands = Brand.all
    @popular_brands = Brand.find(2447,3813,4818,1854,219)

    @item= Item.find(params[:id])
    @price = @item.price.to_s(:delimited)
    @like= @item.likes.count
    @item_next= Item.where("id >?", params[:id]).order("id DESC").last
    @item_prev= Item.where("id <  ?", params[:id]).order("id ASC").last
    @seller_items = @item.seller.selling_items.where.not(id:params[:id]).order("id DESC").limit(6)
    category_item= @item.category
    @related_category = category_item.items.where.not(id:params[:id]).order("id DESC").limit(6)
    @comment= Comment.new
    if params[:id] =="buy"
      render "buy-confirmation.html.haml" 
    elsif user_signed_in? && current_user.id == @item.seller.id
      render "item-detail-user-seller.html.haml"
    else
      render "item-detail.html.haml"
    end
    

    @item = Item.new
    @image = Image.new
    @delivery = Delivery.new
  end

  def create
    binding.pry
    @item = Item.new(item_params)
    respond_to do |format|
      if @item.save

        params[:images][:image].each do |image|
          @item.images.create(image: image, item_id: @item.id)
        end
        format.html{redirect_to root_path}
      else

        # @item.images.build
        # format.html{render action: 'new'}
      end
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
  def item_params
    params.require(:item).permit(
      :name, 
      :description, 
      :state_id, 
      :price, 
      :seller_id, 
      :category_id,
      :brand_id,
      images_attributes:[{image:[]}],    
      delivery_attributes:[:postage_method_id,:postage_detail_id,:prefecture_id,:shipping_date_id],
      ).merge(seller_id: current_user.id)
  end

  # def image_params
  #   # binding.pry
  #   params.require(:image).permit(:image)
  # end
end