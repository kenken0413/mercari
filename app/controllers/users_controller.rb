class UsersController < ApplicationController

  def index
  end

  def show
    render "login.html.haml" if params[:id] == "login"
    render "logout.html.haml" if params[:id] =="logout"
  end

  end