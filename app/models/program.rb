class Program < ApplicationRecord
    has_many :program_choices
    has_many :program_quotas
    has_many :university_choices, through: :program_choices

    validates :name, presence: true

    def universities(academic_year=AcademicYear.current.try(:id))
        University.joins(:program_quotas).where('academic_year_id = ? and program_id = ?', 
        academic_year,self.id)
    end

    def count_applicants(choice_number)
      program_choices.where('choice_order = ?',choice_number).size
    end

    def choice_orders(university)
      university_choices.where('university_id = ?', university).order('university_choices.choice_order').pluck('university_choices.choice_order').uniq
    end

    def applicant_per_university(university,choice_number)
      university_choices.where('university_id = ? and university_choices.choice_order = ?', university, choice_number).size
    end

    def to_s
        name
    end

end
