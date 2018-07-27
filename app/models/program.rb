class Program < ApplicationRecord
    has_many :program_choices
    has_many :program_quotas
    has_many :university_choices, through: :program_choices
    has_many :placements
    validates :name, presence: true

    def universities(academic_year=AcademicYear.current.try(:id))
        University.joins(:program_quotas).where('academic_year_id = ? and program_id = ?', 
        academic_year,self.id)
    end

    def count_applicants(choice_number)
      program_choices.where('choice_order = ?',choice_number).size
    end

    def self.all_choice_orders
      UniversityChoice.joins(:program_choice=>:applicant).
          where('academic_year_id = ?', AcademicYear.current.try(:id)).pluck('university_choices.choice_order').uniq.sort
    end

    def applicant_per_university(university,choice_number)
      university_choices.where('university_id = ? and university_choices.choice_order = ?', university, choice_number).size
    end

    def remaining_quota(uninversity,academic_year=AcademicYear.current)
        total_quota(uninversity,academic_year) - total_placed(uninversity,academic_year)
    end

    def total_placed(university,academic_year=AcademicYear.current)
        placements.joins(:applicant).where('academic_year_id = ? and university_id = ?',academic_year.try(:id),university).size
    end

    def total_quota(university, academic_year=AcademicYear.current)
        academic_year.program_quotas.where('program_id = ? and university_id = ?',self.id,university).first.try(:quota) || 0
    end

    def to_s
        name
    end

end
