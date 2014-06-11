class StaticsController < ApplicationController

  def index
    page = Page.find_by_name("home")
    products = Product.all
    @slider_images = MainSliderImage.all
    @images = products.collect{|x| x.logo_url(:small)}
    @sections = page.sections
  end

  def about_us
    page = Page.find_by_name("about_us")
    @sections = page.sections
  end

  def promotions
    page = Page.find_by_name("promotions")
    @gallery_images = page.gallery.gallery_images
  end

  def events
    @events = Event.all
    if !params[:event_id].nil?
      id = params[:event_id]
    else
      id = @events.last.id
    end
    @event_images = EventImage.where(event_id: id).paginate(:page => params[:page])
  end

  # def magazine
  #   uri = URI('http://search.issuu.com/api/2_0/document')
  #   uri.query = URI.encode_www_form({:username => "ocutecmagazine", :responseParams => "*", :sortBy => "epoch desc"})
  #   res = Net::HTTP.get_response(uri)
  #   if res.is_a?(Net::HTTPSuccess)
  #     resp_json = JSON.parse(res.body) 
  #     mags = Array.new
  #     resp_json["response"]["docs"].each do |x|
  #       mags << [x["description"], x["docname"]]
  #     end
  #     @documents = issuu_get(mags)
  #   end
  # end

  def contact_us
    @message = Message.new
    @main_contact = Contact.where(main: true).take
    @contacts = Contact.by_state
    @states = Array.new
    @contacts.each{|x, i| @states << x}
  end

  ### Product's Line ###

  def technology
    page = Page.find_by_name("technology")
    @sections = page.sections
    @category = @sections.first.category
  end

  def treatments
    page = Page.find_by_name("treatments")
    @sections = page.sections
    @category = @sections.first.category
  end

  def milling
    page = Page.find_by_name("milling")
    @sections = page.sections
    @category = @sections.first.category
  end

  def futurex
    page = Page.find_by_name("futurex")
    @sections = page.sections
    @category = @sections.first.category
  end

  def materials
    page = Page.find_by_name("materials")
    @sections = page.sections
    @category = @sections.first.category
  end

  def type_of_glasses
    page = Page.find_by_name("type_of_glasses")
    @sections = page.sections
    @category = @sections.first.category
  end

  def materials_page
    p params[:_page]
  end


  helper_method :products
  def products(category)
    @products ||= Product.where(category_id: category)
  end

  private
  def issuu_get codes
    codes.each do |code|
      uri = URI.parse("http://issuu.com/ocutecmagazine/docs/#{code[1]}?mode=a_p&wmode=0")
      Net::HTTP.start(uri.host, uri.port) do |http|
        request = Net::HTTP::Get.new uri
        response = http.request request
        code << response.header['location'].split("=").last
      end
    end
  end

end
