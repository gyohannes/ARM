class ProgramChoice < ApplicationRecord
  belongs_to :applicant
  belongs_to :program
  has_many :university_choices, dependent: :destroy

  validates :applicant_id, :program_id, :choice_order, presence: true

  accepts_nested_attributes_for :university_choices, allow_destroy: true, reject_if: :all_blank


end
