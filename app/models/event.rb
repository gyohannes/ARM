class Event < ApplicationRecord
  belongs_to :academic_year

  validates :academic_year_id, :name, :start_time, :end_time, presence: true

end
