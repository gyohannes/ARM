class University < ApplicationRecord
    
    has_many :program_quotas

    def to_s
        name
    end
end
