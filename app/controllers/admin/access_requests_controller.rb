class Admin::AccessRequestsController < ApplicationController
  layout "admin"

  helper_method :access_requests
  def access_requests
    @access_requests ||= AccessRequest.where(state: "opened").to_a
  end


  def create


    request = AccessRequest.new(params[:access_request].permit(:company, :legal_code, :contact, :phone_1, :phone_2, :comments))
     
    respond_to do |format|
      if request.save
          format.html { redirect_to(root_path, flash: {"alert-success" => 'Se guardó satisfactoriamente.'}) }
      else
        format.html { redirect_to(new_user_session_path, flash: {"alert-warning" => 'No se pudo enviar la solicitud. Vuelva a intentarlo detro de unos minutos.'}) }
      end
    end 

  end
end
