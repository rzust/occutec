class MessagesController < ApplicationController
  def create
    message = Message.create(params[:message].permit(:name, :email, :message))
    if message.save
      redirect_to contact_us_path
    else
      redirect_to contact_us_path
    end
  end
end
