class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  helper_method :promotions?, :page_path
  # unless Rails.application.config.consider_all_requests_local
  #   rescue_from Exception, with: :render_500
  #   rescue_from ActionController::RoutingError, with: :render_404
  #   rescue_from ActionController::UnknownController, with: :render_404
  #   rescue_from ActionController::UnknownAction, with: :render_404
  #   rescue_from ActiveRecord::RecordNotFound, with: :render_404
  # end

  def after_sign_in_path_for(resource)
    admin_dashboard_path(resource)
  end

  def after_sign_out_path_for(resource)
    admin_dashboard_path
  end

  def promotions?
    page = Page.find_by_name("promotions")
    !page.gallery.gallery_images.empty?
  end

  private
  def render_404
    render 'shared/404', :status => 404
  end

  def render_505
    render 'shared/500', :status => 500
  end

  def page_path(name)
    case name
    when 'Tecnología Digital'
      technology_path
    when 'Tallado Convencional'
      milling_path
    when 'Tratamientos'
      treatments_path
    when 'Lentes Future X'
      futurex_path
    when 'Materiales'
      materials_path
    when 'Tipos de Lentes'
      type_of_glasses_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :username
  end
end
