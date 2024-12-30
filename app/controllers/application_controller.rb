class ApplicationController < ActionController::Base
  before_action :set_user_timezone
  before_action :set_locale
  
  def set_user_timezone
    if session[:timezone]
      Time.zone = session[:timezone]  # Set the time zone from the session
    else
      Time.zone = 'UTC'  # Default to UTC if no timezone is set
    end
  end
  
  # This action will be called by the AJAX request to set the user's time zone
  def set_timezone
    session[:timezone] = params[:timezone]  # Store the time zone in the session
    render json: { status: 'success' }  # Respond with success message
  end

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
