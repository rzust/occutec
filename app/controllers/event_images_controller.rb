class EventImagesController < ApplicationController
  def index
    @event = Event.find(params[:event_id])
    @event_images = @event.event_images
  end
end
