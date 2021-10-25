class AddDirectorateToParticipant < ActiveRecord::Migration[5.2]
  def change
    add_reference :directorates, type: :uuid
  end
end
