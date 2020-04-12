class StoreController < ApplicationController
#class StoreController < ActiveRecord :: Base64
  def index
  @products = Product.order(:title)
  end
end
