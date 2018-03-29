class ProgramQuota < ApplicationRecord
  belongs_to :academic_year
  belongs_to :program
  belongs_to :university

  validates :academic_year_id, :program_id, :university_id,:quota, presence: true
  validates :university_id, uniqueness: {scope: [:academic_year_id, :program_id],
                                         :message => "Quota is already set for this university"}


  def self.overall_total
    ProgramQuota.pluck(:quota).sum
  end

end
