class Participant < ApplicationRecord
  belongs_to :event
  belongs_to :organization_type
  belongs_to :directorate, optional: true
  belongs_to :group, optional: true
  belongs_to :participant_type, optional: true

  def to_s
    name
  end

  def self.import_participants(file)
    participants = []
    event = Event.current
    CSV.foreach(file.path, :headers=>true) do |row|
      name = row[0]
      organization_name = row[1]
      organization_type = OrganizationType.find_or_create_by(name: row[2])
      directorate = Directorate.find_or_create_by(name: row[3])
      responsibility = row[4]
      place_of_work = row[5]
      telephone_number = row[6]
      email = row[7]
      participant_type = ParticipantType.find_or_create_by(name: row[8])
      stay_at = row[9]
      group = Group.find_or_create_by(name: row[10])
      field_visit = row[11]
      checked_in = row[12].blank? ? '' : (row[12].downcase == 'yes' ? true : false)
      attrbts = {event_id: event.try(:id), name: name, organization_name: organization_name,
                 organization_type_id: organization_type.try(:id), directorate_id: directorate.try(:id),
                 responsibility: responsibility, place_of_work: place_of_work, telephone_number: telephone_number,
                 email: email, participant_type_id: participant_type.try(:id), stay_at: stay_at,
                 group_id: group.try(:id), field_visit: field_visit, checked_in: checked_in}
      particpant = Participant.create(attrbts)
      participants << particpant
    end
    return participants
  end

  def serial_no
    serial_no = (Participant.all.index(self) + 1 ).to_s
    while serial_no.length < 3
      serial_no =  '0' << serial_no
    end
    return serial_no
  end

  def checkedin_status
    checked_in == true ? 'Yes' : ''
  end
end
