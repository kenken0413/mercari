class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_card, only: [:buy_confirmation, :purchase,:show]
  before_action :user_signed_in_check, only: [:buy_confirmation]

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
    @image = @item.images.build
    # @delivery = Delivery.new
    # @image = Image.new
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
    @item.save
    redirect_to root_path
 
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

  # def return_payjp_token(payjp_token)
  #   if params['payjp-token'].present?
  #     return params['payjp-token']
  #   else
  #     payjp_token
  #   end
  # end

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
end