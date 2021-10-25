class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :organization_type, optional: true
  belongs_to :directorate, optional: true
  belongs_to :group, optional: true
  belongs_to :field_visit, optional: true
  belongs_to :participant_type
  belongs_to :region

  validates :name, :organization, :address, :telephone_number, presence: true
  validates :serial_number, uniqueness: { case_sensitive: false }

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
      region = row[1].blank? ? nil : Region.find_or_create_by(name: row[1])
      organization = row[2]
      position = row[3]
      directorate = row[4].blank? ? nil : Directorate.find_or_create_by(name: row[4])
      email = row[5]
      telephone_number = row[6]
      participant_type = row[7].blank? ? nil : ParticipantType.find_or_create_by(name: row[7])
      stay_at = row[8]
      group = row[9].blank? ? nil : Group.find_or_create_by(name: row[9])
      field_visit = row[10].blank? ? nil : FieldVisit.find_or_create_by(name: row[10])
      attrbts = {event_id: event.try(:id), name: name, region_id: region.try(:id), organization: organization,
                 position: position, directorate_id: directorate.try(:id),
                 telephone_number: telephone_number, email: email, participant_type_id: participant_type.try(:id),
                 stay_at: stay_at, group_id: group.try(:id), field_visit_id: field_visit.try(:id)}
      particpant = Participant.create(attrbts)
      participants << particpant unless particpant.blank?
    end
    return participants
  end

  def set_serial_number
    serial_no = (Participant.count + 1).to_s
    while serial_no.length < 3
      serial_no =  '0' << serial_no
    end
    self[:serial_number] = serial_no
  end

end
