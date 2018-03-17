class ProgramChoice < ApplicationRecord
  belongs_to :applicant
  belongs_to :program, optional: true
  has_many :university_choices, dependent: :destroy

  validates :program_id, uniqueness: {scope: :applicant_id }, if: :program_not_blank?

  def program_not_blank?
    !program.blank?
  end

  def complete_university_choices
    university_choices.where('university_id is not null')
  end

  def program_should_be_uniq
    pcs = applicant.program_choices.pluck('program_id')
    unless pcs == pcs.uniq
      errors.add('Program', 'already selected')
    end
  end

end
