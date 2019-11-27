class UsersController < ApplicationController

  def index
  end

  def show
    render "login.html.haml" if params[:id] == "login"
    render "logout.html.haml" if params[:id] =="logout"
    render "identification.html.haml" if params[:id] =="identification"
  end

  def sign_out
    redirect_to '/items/index'
  end
end