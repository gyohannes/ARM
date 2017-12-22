class Program < ApplicationRecord
    has_many :program_choices
    has_many :program_quotas


    def universities(academic_year=AcademicYear.current.try(:id))
        University.joins(:program_quotas).where('academic_year_id = ? and program_id = ?', 
        academic_year,self.id)
    end

    def to_s
        name
    end

end
