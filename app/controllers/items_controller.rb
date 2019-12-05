class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_card, only: [:buy_confirmation, :purchase,:show]
  before_action :user_signed_in_check, only: %i[buy_confirmation new]
  before_action :set_parent_category,only:[:index,new,:edit,:create]

  def index
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
    # @delivery = Delivery.where(item_id:@item.id)
    # @image = Image.find(params[:id])
    @parents = Category.all.order("ancestry ASC").limit(13)
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    @item.images.update(
      image: item_params[:images_attributes]["0"]["image"]
    )
    redirect_to "/items/#{@item.id}"
    if @item.update(item_params)
      redirect_to "/items/#{@item.id}"
    else
      render :edit
    end
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
    if user_signed_in? && current_user.id == @item.seller.id
      render "item-detail-user-seller.html.haml"
    else
      render "item-detail.html.haml"
    end
    @item = Item.new
    @image = Image.new
    @delivery = Delivery.new

  end

  require 'payjp'

  def buy_confirmation
    @item= Item.find(params[:id])
    if @credit.present?
      Payjp.api_key = 'sk_test_9581dc90803e604af65e7f4c'
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      @credit_information = customer.cards.retrieve(@credit.card_id)
    end
  end

  def purchase
    @item= Item.find(params[:id])
    @item.update(buyer_id: current_user.id)
    if @credit.present?
      Payjp.api_key = 'sk_test_9581dc90803e604af65e7f4c'
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      @credit_information = customer.cards.retrieve(@credit.card_id)
    end

    Payjp.api_key = 'sk_test_9581dc90803e604af65e7f4c'
    customer = Payjp::Customer.retrieve(@credit.customer_id)
    @payjp_token = @credit.customer_id if @credit.present?
      Payjp::Charge.create(
        amount: @item.price, # 決済する値段
        customer: @payjp_token,
        currency: 'jpy',
        description: current_user.nickname
      )
      redirect_to root_path
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        params[:images][:image].each do |image|
          @item.images.create(image: image, item_id: @item.id)
        end
        redirect_to root_path
      else
        @item.images.build
        render '/items/new'
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

  def destroy
    @item = Item.find(params[:id])
    @item.destroy if @item.seller.id == current_user.id
    redirect_to root_path
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
      images_attributes:[:image],    
      delivery_attributes:[:postage_method_id,:postage_detail_id,:prefecture_id,:shipping_date_id],
      ).merge(seller_id: current_user.id)
  end

  def set_card
    if user_signed_in?
      @credit = Credit.where(user_id: current_user.id).first if Credit.where(user_id: current_user.id).present?
    else
      @credit = 'nil'
    end
  end

  def user_signed_in_check
    redirect_to '/users/sign_in' unless user_signed_in?
  end

  def set_parent_category
    @parents = Category.all.order("ancestry ASC").limit(13)
  end

end