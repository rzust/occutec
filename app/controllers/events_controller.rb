class EventsController < ApplicationController
  def index
    @events = Event.all.order(:date).paginate(:page => params[:page])
  end
end
