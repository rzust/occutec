class Admin::AccessRequestsController < ApplicationController
  layout "admin"

  helper_method :access_requests, :access_requests_all, :access_request
  def access_requests_all
    @access_requests_all ||= AccessRequest.all
  end

  def access_requests
    @access_requests ||= AccessRequest.where(state: "opened").to_a
  end

  def access_request
    @access_request ||= AccessRequest.find(params[:id])
  end


  def create
    request = AccessRequest.new(params[:access_request].permit(:company, :legal_code, :contact, :phone_1, :phone_2, :comment))
     
    respond_to do |format|
      if request.save
          format.html { redirect_to(root_path, flash: {"alert-success" => 'Se guardó satisfactoriamente.'}) }
      else
        format.html { redirect_to(new_user_session_path, flash: {"alert-warning" => 'No se pudo enviar la solicitud. Vuelva a intentarlo detro de unos minutos.'}) }
      end
    end 
  end

  def accept
    access_request.accept
    redirect_to admin_access_requests_path
  end

  def reject
    access_request.reject
    redirect_to admin_access_requests_path
  end
end
