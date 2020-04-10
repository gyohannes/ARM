class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :organization_type,optional: true
  belongs_to :directorate, optional: true
  belongs_to :group, optional: true
  belongs_to :field_visit, optional: true
  belongs_to :participant_type, optional: true

  has_one_attached :photo

  validates :name, :organization_type_id, :telephone_number, presence: true
  #after_create :set_serial_no

  def to_s
    name
  end

  def self.import_participants(file)
    participants = []
    event = Event.current
    CSV.foreach(file.path, :headers=>true, encoding: 'iso-8859-1:utf-8') do |row|
      name = row[0]
      organization_type = row[1].blank? ? nil : OrganizationType.find_or_create_by(name: row[1])
      telephone_number = row[2]
      attrbts = {event_id: event.try(:id), name: name, organization_type_id: organization_type.try(:id), telephone_number: telephone_number}
      particpant = Participant.create(attrbts)
      participants << particpant unless particpant.blank?
    end
    return participants
  end

  def serial_number
    serial_number = self.id.to_s
    while serial_number.length < 4
      serial_number =  '0' << serial_number
    end
    return serial_number
  end

  def set_serial_no
    serial_no = self.id.to_s
    while serial_no.length < 4
      serial_no =  '0' << serial_no
    end
    update(serial_no: serial_no)
  end

  def checkedin_status
    checked_in == true ? 'Yes' : ''
  end
end
