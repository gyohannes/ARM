class AddSerialNoToParticipant < ActiveRecord::Migration[5.2]
  def change
    add_column :participants, :serial_no, :string
  end
end
