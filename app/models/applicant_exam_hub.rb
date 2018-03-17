class ApplicantExamHub < ApplicationRecord
  belongs_to :applicant
  belongs_to :exam_hub

  validates :exam_hub_id, presence: true

  def to_s
    exam_hub
  end
end
