class UsersController < ApplicationController

  def index
    @parents = Category.all.order("ancestry ASC").limit(13)
    @popular_brands = Brand.find(2447,3813,4818,1854)
  end

  def show
    @parents = Category.all.order("ancestry ASC").limit(13)
    @popular_brands = Brand.find(2447,3813,4818,1854)
    render "login.html.haml" if params[:id] == "login"
  end

  def sign_out
    redirect_to '/items/index'
  end

  def card_index
    @parents = Category.all.order("ancestry ASC").limit(13)
    @popular_brands = Brand.find(2447,3813,4818,1854)
    @credit = Credit.where(user_id: current_user.id).first if Credit.where(user_id: current_user.id).present? 
    if @credit.present?
      Payjp.api_key = 'sk_test_9581dc90803e604af65e7f4c'
      customer = Payjp::Customer.retrieve(@credit.customer_id)
      @credit_information = customer.cards.retrieve(@credit.card_id)
    end
  end

  def card_registrations
    @parents = Category.all.order("ancestry ASC").limit(13)
    @popular_brands = Brand.find(2447,3813,4818,1854)
    credit = Credit.where(user_id: current_user.id).first
  end

  def identification
    @parents = Category.all.order("ancestry ASC").limit(13)
    @popular_brands = Brand.find(2447,3813,4818,1854)
  end

  def logout
    @parents = Category.all.order("ancestry ASC").limit(13)
    @popular_brands = Brand.find(2447,3813,4818,1854)
  end

end