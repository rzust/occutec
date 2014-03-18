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

  def edit_technology
    page = Page.find_by_name("technology")
    @sections = Section.where(page_id: page.id).to_a
  end

end

### Pages ###

# ID # Name 
# 01 # About Us
# 02 # Home
# 03 # Promotions
# 04 # Events
# 05 # Contact Us
# 06 # Digital Technology