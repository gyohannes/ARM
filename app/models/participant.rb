class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :organization_type
  belongs_to :group, optional: true
  belongs_to :field_visit, optional: true
  belongs_to :participant_type
  belongs_to :region
  belongs_to :user, optional: true
  validates :name, :organization, :email, :email_confirmation, :address, :telephone_number, presence: true
  #validates :serial_number, uniqueness: { case_sensitive: false }
  #validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :email, confirmation: true

  has_one_attached :photo

  before_create :set_serial_number, if: :no_serial

  def no_serial
    set_serial_number.blank?
  end

  def to_s
    name
  end

  def self.import_participants(file)
    participants = []
    event = Event.current
    CSV.foreach(file.path, :headers=>true, encoding: 'iso-8859-1:utf-8') do |row|
      name = row[0]
      region = row[1].blank? ? nil : Region.find_or_create_by(name: row[1])
      organization_type = row[2].blank? ? nil : OrganizationType.find_or_create_by(name: row[2])
      organization = row[3]
      position = row[4]
      address = row[5]
      telephone_number = row[6]
      email = row[7]
      participant_type = row[8].blank? ? nil : ParticipantType.find_or_create_by(name: row[8])
      stay_at = row[9]
      group = row[10].blank? ? nil : Group.find_or_create_by(name: row[10])
      field_visit = row[11].blank? ? nil : FieldVisit.find_or_create_by(name: row[11])
      attrbts = {event_id: event.try(:id), name: name, region_id: region.try(:id), organization: organization,
                 organization_type_id: organization_type.try(:id), position: position, address: address,
                 telephone_number: telephone_number, email: email, participant_type_id: participant_type.try(:id),
                 stay_at: stay_at, group_id: group.try(:id), field_visit_id: field_visit.try(:id)}
      particpant = Participant.create(attrbts)
      participants << particpant unless particpant.blank?
    end
    return participants
  end

  def set_serial_number
    serial_no = (Participant.count == 0 ? 1 : Participant.count + 1).to_s
    while serial_no.length < 3
      serial_no =  '0' << serial_no
    end
    self[:serial_number] = serial_no
  end

end
