class AddFieldVisitToParticipant < ActiveRecord::Migration[5.2]
  def change
    add_reference :participants, :field_visit
  end
end
