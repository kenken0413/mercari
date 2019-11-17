class UsersController < ApplicationController

  def index
  end

  def show
    if params[:id] == "login"
      render "login.html.haml"
      return
    end

  end

end