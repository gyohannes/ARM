class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :organization_type
  belongs_to :directorate, optional: true
  belongs_to :group, optional: true
  belongs_to :participant_type, optional: true

  validates :name, :organization_name, presence: true

  def to_s
    name
  end

  def serial_no
    serial_no = id.to_s
    while serial_no.length < 3
      serial_no =  '0' << serial_no
    end
    return serial_no
  end

  def checkedin_status
    checked_in == true ? 'Yes' : ''
  end
end
