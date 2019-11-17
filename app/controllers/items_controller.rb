class ItemsController < ApplicationController

  def index
  end

  def show
    if params[:id] == "sell"
      render "sell.html.haml"
      return
    end

    if params[:id] =="detail"
      render "item-detail.html.haml"
      return
    end

    if params[:id] =="buy"
      render "buy-confirmation.html.haml"
      return
    end
  end

end
