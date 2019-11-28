class UsersController < ApplicationController

  def index
    @parents = Category.all.order("ancestry ASC").limit(13)
  end

  def show
    @parents = Category.all.order("ancestry ASC").limit(13)
    render "login.html.haml" if params[:id] == "login"
    render "logout.html.haml" if params[:id] =="logout"
    render "identification.html.haml" if params[:id] =="identification"
  end

  def sign_out
    @parents = Category.all.order("ancestry ASC").limit(13)
    redirect_to '/items/index'
  end
end