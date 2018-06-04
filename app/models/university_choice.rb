class UniversityChoice < ApplicationRecord
  belongs_to :program_choice
  belongs_to :university, optional: true

  validates :university_id, uniqueness: {scope: :program_choice_id }, if: :university_not_blank?

  def university_not_blank?
    !university.blank?
  end

  def to_s
    university
  end

end
