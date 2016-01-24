class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout :session_layout
  helper_method :current_commander

  def current_commander
    @current_commander ||=
      Cmdr.find(session[:current_cmdr_id]) if session[:current_cmdr_id]
  end

  def current_commander=(cmdr)
    @current_commander = cmdr
  end

  private

  def session_layout
    current_commander.nil? ? "application" : "commander"
  end

end
