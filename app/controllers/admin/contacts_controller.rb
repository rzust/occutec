class Admin::ContactsController < ApplicationController
  before_filter :authenticate_user!
  layout 'admin'
  helper_method :main_contact, :contacts, :contact
  def main_contact
    @main_contact ||= Contact.where(main: true).take
  end

  def contact
    @contact ||= Contact.find(params[:id])
  end

  def contacts
    @contacts ||= Contact.where(main: false)
  end

  def new
    @contact = Contact.new    
  end

  def create
    @contact = Contact.create(params[:contact].permit!)
    @contact.update(main: false)
    if @contact.save
      redirect_to admin_contacts_path
    else
      render :new
    end
  end

  def update
    
    if contact.update(params[:contact].permit!)
      redirect_to admin_root_path
    else
      if contact.main?
        render :edit_main
      else
        render :edit
      end
    end

  end

  def destroy
    @id = contact.id
    contact.destroy
    render layout: nil
  end  
end
