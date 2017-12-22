class CreateUniversityChoices < ActiveRecord::Migration[5.1]
  def change
    create_table :university_choices do |t|
      t.references :program_choice, foreign_key: true
      t.integer :choice_order
      t.references :university, foreign_key: true

      t.timestamps
    end
  end
end
