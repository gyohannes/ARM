class ProgramQuota < ApplicationRecord
  belongs_to :academic_year
  belongs_to :program
  belongs_to :university

  validates :quota, presence: true

  def self.overall_total
    ProgramQuota.pluck(:quota).sum
  end

end
