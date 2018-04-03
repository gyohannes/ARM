class ExamHub < ApplicationRecord
  belongs_to :region
  has_many :applicant_exam_hubs
  has_many :applicants, through: :applicant_exam_hubs

  validates :region_id, :name, :city, :ceiling, presence: true

  def total_applicants(academic_year=AcademicYear.current.id)
    applicants.joins(:applicant_exam_hub).where('academic_year_id = ?', academic_year).uniq || []
  end

  def to_s
    name
  end

end
