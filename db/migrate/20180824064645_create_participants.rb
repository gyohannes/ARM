class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants, id: :uuid do |t|
      t.references :event, type: :uuid, foreign_key: true
      t.string :name
      t.string :amharic_name
      t.string :telephone_number
      t.references :organization_type, type: :uuid, foreign_key: true

      t.timestamps
    end
  end
end
