class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :resource_name, :resource, :devise_mapping

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_filter :store_current_location, unless: :devise_controller?

  include UserLocation

  private

    def store_current_location
      store_location_for(:user, request.url)
    end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys:[:name])
    end

    def resource_name
      :user
    end

    def resource
      @resource ||= User.new
    end

    def devise_mapping
      @devise_mapping ||= Devise.mappings[:user]
    end

end
