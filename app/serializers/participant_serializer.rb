class ParticipantSerializer < ActiveModel::Serializer

  attributes :id, :name, :organization_type_id, :phone_number, :photo

  def photo
    rails_blob_path(object.photo, only_path: true) if object.photo.attached?
  end

end
