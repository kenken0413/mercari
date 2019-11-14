class ItemsController < ApplicationController

  def index
  end

  def show
    if params[:id] == "sell"
      render "sell.html.haml"
      return
    end
  end

end
