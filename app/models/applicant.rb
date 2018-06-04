class Applicant < ApplicationRecord
    has_many :program_choices, dependent: :destroy
    belongs_to :user
    belongs_to :region
    has_one :match_result
    has_one :applicant_exam_hub, dependent: :destroy
    has_one :applicant_service,  dependent: :destroy
    has_one :applicant_declaration
    has_many :declaration_details, through: :applicant_declaration

    validates :title, :gender, :first_name, :father_name, :grand_father_name,
              :date_of_birth, :marital_status, :phone, :city, presence: true

    validates :user_id, uniqueness: {scope: :academic_year_id,
                                     message: 'already started application. Please go to Home --> Application Details and edit your application'}

    def complete_program_choices
      program_choices.where('program_id is not null')
    end

    def complete_university_choices
      program_choices.map{|x| x.complete_university_choices }.flatten
    end

    def application_status
        !match_result.blank? ? 'Matched' : (status == true ? 'Submitted' : 'Draft')
    end

    def application_complete
      !applicant_exam_hub.blank? and !complete_program_choices.blank? and !complete_university_choices.blank? and !attachment.blank?
    end

    def full_name
      [title, first_name, father_name, grand_father_name].join(' ')
    end

    def program_choice(order)
      program_choices.where('choice_order = ?', order).first
    end

end
