class Admin::EventsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'
  helper_method :event, :events

  def events
    @events = Event.all
  end

  def event
    @event ||= Event.find(params[:id])
  end

  def new
    @event = Event.new
  end  

  def create
    event = Event.create(params.require(:event).permit(:name, :description, :date))
    
    if event.save
      flash[:success] = "Event successfully created"
      redirect_to images_panel_admin_event_path(event)
    else
      flash[:warning] = "An error ocurred"
      render :new
    end
  end

  def update
    event = Event.find(params[:id])
    event.update(params.require(:event).permit(:name, :description, :date))
    
    if event.save
      flash[:success] = "Event successfully updated"
      redirect_to images_panel_admin_event_path(event)
    else
      flash[:warning] = "An error ocurred"
      render :edit
    end
  end

  def images_panel
    @resource = event
    @event_images = @resource.event_images.build
  end

  def destroy
    @id = event.id
    event.destroy
    render layout: nil
  end
end
