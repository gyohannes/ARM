class AddColorToParticipantType < ActiveRecord::Migration[5.2]
  def change
    add_column :participant_types, :badge_color, :string
  end
end
