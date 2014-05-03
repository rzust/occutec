class Admin::StaticsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def edit_home 
    page = Page.find_by_name("home")
    @sections = Section.where(page_id: page.id).to_a
  end

  def edit_about_us
    page = Page.find_by_name("about_us")
    @sections = Section.where(page_id: page.id).to_a
  end

  def edit_promotion
    page = Page.find_by_name("promotions")
    @resource = page
    @gallery_image = @resource.gallery.gallery_images.build
    @sections = Section.where(page_id: page.id).to_a
  end
  
  def edit_events
    page = Page.find_by_name("events")
    @sections = Section.where(page_id: page.id).to_a
  end
  
  def edit_contact_us
    page = Page.find_by_name("contact_us")
    @sections = Section.where(page_id: page.id).to_a
  end

  ### Product's Line ###

  def edit_technology
    page = Page.find_by_name("technology")
    @sections = Section.where(page_id: page.id).to_a
  end

  def edit_treatments
    page = Page.find_by_name("treatments")
    @sections = Section.where(page_id: page.id).to_a
  end

  def edit_milling
    page = Page.find_by_name("milling")
    @sections = Section.where(page_id: page.id).to_a
  end
  
  def edit_futurex
    page = Page.find_by_name("futurex")
    @sections = Section.where(page_id: page.id).to_a
  end

  def edit_materials
    page = Page.find_by_name("materials")
    @sections = Section.where(page_id: page.id).to_a
  end

  def edit_type_of_glasses
    page = Page.find_by_name("type_of_glasses")
    @sections = Section.where(page_id: page.id).to_a
  end

  def panel
    @category = Category.find(params[:id])
  end

  def edit_section
    @category = Category.find(params[:id])
  end

  helper_method :products
  def products(category)
    @products ||= Product.where(category_id: category)
  end

end

