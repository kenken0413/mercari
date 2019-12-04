class BrandsController < ApplicationController
  # いらない？

  def search
    @brands = Brand.where('brand LIKE(?)', "%#{params[:keyword]}%").limit(20)
    respond_to do |format|
      format.html
      format.json 
    end
  end

end