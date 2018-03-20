class AcademicYear < ApplicationRecord

    has_many :events
    

    def self.current
        self.where('status = ?', true).first
    end

    def current_status
        status? ? 'Active' : ''
    end
    def to_s
        name
    end
end

