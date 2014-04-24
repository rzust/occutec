class Admin::GalleryImagesController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index
    if !params[:product_id].nil?
      resource = Product.find(params[:product_id])
    else
      resource = Page.find(params[:page_id])
    end
    @images = resource.gallery_images
    render :json => @images.collect { |p| p.to_jq_upload }.to_json
  end

  def create
    if !params[:product_id].nil?
      resource = Product.find(params[:product_id])
    else
      resource = Page.find(params[:page_id])
    end
    
    @gallery_image = resource.gallery.gallery_images.new(params.require(:gallery_image).permit!)

    if @gallery_image.save
      respond_to do |format|
        format.html {  
          render :json => [@gallery_image.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => {files: [@gallery_image.to_jq_upload]}.to_json           
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @gallery_image = GalleryImage.find(params[:id])
    @gallery_image.remove_image!
    @gallery_image.destroy
    render :json => true
  end

end
