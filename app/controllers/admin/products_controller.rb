class Admin::ProductsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'
  helper_method :product, :products, :sections

  def products
    @products = Product.all
  end

  def product
    @product ||= Product.find(params[:id])
  end

  def sections
    @sections = product.sections
  end

  def new
    @product = Product.new
    @category = Category.find(params[:category_id])
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
    @counter = 0
  end

  def create
    product = Product.create(params.require(:product).permit(:name, :logo, :description, :category_id))
    product.create_gallery

    if params[:section]
      sections = params[:section]
      sections.each do |x|
        section = Section.find(x[0])
        section.update(x[1])
      end
    end

    if params[:new_section]
      sections = params[:new_section]
      sections.each do |x|
        section = product.sections.create(x[1]) unless x[1]["body"].nil? || x[1]["body"] == ""
      end
    end

    if product.save
      flash[:success] = "Product successfully created"
      redirect_to images_panel_admin_product_path(product)
    else
      flash[:warning] = "An error ocurred"
      render :new
    end
  end

  def update
    product = Product.find(params[:id])
    product.update(params.require(:product).permit(:name, :logo, :description, :category_id))

    if params[:section]
      sections = params[:section]
      sections.each do |x|
        section = Section.find(x[0])
        section.update(x[1])
      end
    end

    if params[:new_section]
      sections = params[:new_section]
      sections.each do |x|
        section = product.sections.create(x[1]) unless x[1]["body"].nil? || x[1]["body"] == ""
      end
    end

    if product.save
      flash[:success] = "Product successfully updated"
      redirect_to images_panel_admin_product_path(product)
    else
      flash[:warning] = "An error ocurred"
      render :edit
    end
  end

  def remove_logo
    product = Product.find(params[:id])
    product.remove_logo!
    product.save
    redirect_to edit_admin_product_path(product)
  end

  def destroy
    @id = product.id
    product.destroy
    render layout: nil
  end

  def images_panel
    @resource = product
    @gallery_image = @resource.gallery.gallery_images.build
  end

  def add_section
    @counter = params[:counter].to_i
    @counter += 1
    render layout: nil
  end
end
