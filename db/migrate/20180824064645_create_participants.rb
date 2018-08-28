class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.references :event, foreign_key: true
      t.string :name
      t.string :title
      t.string :telephone_number
      t.string :email
      t.string :organization_name
      t.references :organization_type, foreign_key: true
      t.references :directorate, foreign_key: true
      t.string :responsibility
      t.string :place_of_work
      t.references :group, foreign_key: true
      t.string :field_visit
      t.string :stay_at
      t.references :participant_type, foreign_key: true
      t.boolean :checked_in

      t.timestamps
    end
  end
end
