class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :year
      t.string :name
      t.string :amharic_name
      t.string :motto
      t.string :amharic_motto
      t.date :start_date
      t.date :end_date
      t.string :location
      t.string :amharic_location
      t.boolean :status

      t.timestamps
    end
  end
end
