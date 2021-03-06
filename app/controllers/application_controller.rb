class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    editable_fields = [:first_name, :last_name, :group_id, :twitter, :picture]

    devise_parameter_sanitizer.for(:sign_up) do |person|
      person.permit(editable_fields + [:email, :password, :password_confirmation, :type])
    end

    devise_parameter_sanitizer.for(:account_update) do |person|
      person.permit(editable_fields)
    end
  end
end
