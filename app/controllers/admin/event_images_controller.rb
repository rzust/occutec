class Admin::EventImagesController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'

  def index
    resource = Event.find(params[:event_id])
    @images = resource.event_images
    render :json => @images.collect { |p| p.to_jq_upload }.to_json
  end

  def create
    
    resource = Event.find(params[:event_id])
    
    @event_image = resource.event_images.new(params.require(:event_image).permit!)

    if @event_image.save
      respond_to do |format|
        format.html {  
          render :json => [@event_image.to_jq_upload].to_json, 
          :content_type => 'text/html',
          :layout => false
        }
        format.json {  
          render :json => {files: [@event_image.to_jq_upload]}.to_json           
        }
      end
    else 
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end

  def destroy
    @event_image = EventImage.find(params[:id])
    @event_image.remove_image!
    @event_image.destroy
    render :json => true
  end
end
