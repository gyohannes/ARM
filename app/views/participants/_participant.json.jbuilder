json.extract! participant, :id, :event_id, :name, :title, :telephone_number, :email, :organization_name, :organization_type_id, :directorate_id, :responsibility, :place_of_work, :group_id, :field_visit, :stay_at, :participant_type_id, :checked_in, :created_at, :updated_at
json.url participant_url(participant, format: :json)
