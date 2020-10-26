class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :organization_type
  belongs_to :group, optional: true
  belongs_to :field_visit, optional: true
  belongs_to :participant_type
  belongs_to :region

  validates :name, :organization_name, :address, :telephone_number, presence: true
  validates :serial_no, uniqueness: { case_sensitive: false }

  has_one_attached :photo

  before_create :set_serial_number

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

  def set_serial_number
    serial_number = (Participant.count + 1).to_s
    while serial_number.length < 4
      serial_number =  '0' << serial_number
    end
    self[:serial_number] = serial_number
  end

  def checkedin_status
    checked_in == true ? 'Yes' : ''
  end
end
