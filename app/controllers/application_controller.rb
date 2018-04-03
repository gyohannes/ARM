class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  respond_to :html, :js, :json, :pdf
  before_action :set_application_calendar

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to root_path, alert: exception.message }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end

  def set_application_calendar
    ay = AcademicYear.current
    @application_calendar = ay.events.where('name = ?', 'Application').first rescue nil
  end

end
