class Admin::MainSliderImagesController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index
    @images = MainSliderImage.all
    render :json => @images.collect { |p| p.to_jq_upload }.to_json
  end

  def create    
    @main_slider_image = MainSliderImage.new(params.require(:main_slider_image).permit!)

    if @main_slider_image.save
      respond_to do |format|
        format.html {  
          render :json => [@main_slider_image.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => {files: [@main_slider_image.to_jq_upload]}.to_json           
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @main_slider_image = MainSliderImage.find(params[:id])
    @main_slider_image.remove_image!
    @main_slider_image.destroy
    render :json => true
  end

  def panel
    @main_slider_image = MainSliderImage.new
  end
end
