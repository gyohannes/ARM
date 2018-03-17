class Service < ApplicationRecord
  belongs_to :applicant_service
  belongs_to :region

  validates :institution, :region_id, :start_date, :end_date, presence: true

end
