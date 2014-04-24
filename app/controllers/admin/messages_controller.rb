class Admin::MessagesController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'
  helper_method :message, :messages, :unread

  def message
    @message ||= Message.find(params[:id])
  end

  def messages
    @messages ||= Message.all
  end

  def show
    message.read
  end

  def unread
    @messages ||= Message.where(state: "unread")
  end

  def destroy
    @id = message.id
    message.destroy
    render layout: nil
  end
end
