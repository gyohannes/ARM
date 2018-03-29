class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  respond_to :html, :js, :json, :pdf
  before_action :set_application_calendar

  def set_application_calendar
    ay = AcademicYear.current
    @application_calendar = ay.events.where('name = ?', 'Application').first rescue nil
  end

end
