class CreateFieldVisits < ActiveRecord::Migration[5.2]
  def change
    create_table :field_visits do |t|
      t.string :name

      t.timestamps
    end
  end
end
