class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants, id: :uuid do |t|
      t.references :event, type: :uuid, foreign_key: true
      t.string :name
      t.string :amharic_name
      t.references :region, type: :uuid, foreign_key: true
      t.references :organization_type, type: :uuid, foreign_key: true
      t.string :organization
      t.string :position
      t.string :address
      t.string :telephone_number
      t.string :email
      t.references :participant_type, type: :uuid, foreign_key: true
      t.string :stay_at
      t.references :group, type: :uuid, foreign_key: true
      t.references :field_visit, type: :uuid, foreign_key: true
      t.string :serial_number

      t.timestamps
    end
  end
end
