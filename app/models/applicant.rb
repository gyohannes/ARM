class Applicant < ApplicationRecord
    has_many :program_choices, dependent: :destroy
    belongs_to :user
    has_one :match_result

    validates :first_name, :father_name, :grand_father_name, presence: true

    accepts_nested_attributes_for :program_choices, allow_destroy: true, reject_if: :all_blank

    def application_status
        !match_result.blank? ? 'Matched' : (status == true ? 'Submitted' : 'Draft')
    end

end
