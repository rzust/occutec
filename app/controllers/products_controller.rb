class ProductsController < ApplicationController
  helper_method :product, :products

  def products
    @products = Product.all
  end

  def product
    @product ||= Product.find(params[:id])
  end
end
