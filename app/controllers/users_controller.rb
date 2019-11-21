class UsersController < ApplicationController

  def index
  end

  def show
    render "login.html.haml" if params[:id] == "login"
    render "logout.html.haml" if params[:id] =="logout"
  end

  def card_index
  end

  def card_registrations
  end

  end