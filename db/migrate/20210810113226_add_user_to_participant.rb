class AddUserToParticipant < ActiveRecord::Migration[5.2]
  def change
    add_reference :participants, :user, index: true
  end
end
