class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern

  rescue_from ActiveRecord::ConnectionNotEstablished, with: :handle_db_connection_error

  private

  def handle_db_connection_error(exception)
    flash[:alert] = "Error: Database disconnected."
    redirect_to error_url
  end
end
