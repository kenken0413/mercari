class UsersController < ApplicationController

  def index
    @parents = Category.all.order("ancestry ASC").limit(13)
    @popular_brands = Brand.find(2447,3813,4818,1854)
  end

  def show
    @parents = Category.all.order("ancestry ASC").limit(13)
    @popular_brands = Brand.find(2447,3813,4818,1854)
    render "login.html.haml" if params[:id] == "login"
    render "logout.html.haml" if params[:id] =="logout"
    render "identification.html.haml" if params[:id] =="identification"
  end

  def sign_out
    redirect_to '/items/index'
  end
end