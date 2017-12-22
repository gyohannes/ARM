class UniversityChoice < ApplicationRecord
  belongs_to :program_choice
  belongs_to :university

  validates :university_id, :program_choice_id, :choice_order, presence: true

end
