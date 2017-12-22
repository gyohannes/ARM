class CreateProgramQuotas < ActiveRecord::Migration[5.1]
  def change
    create_table :program_quotas do |t|
      t.references :academic_year, foreign_key: true
      t.references :program, foreign_key: true
      t.references :university, foreign_key: true
      t.integer :quota

      t.timestamps
    end
  end
end
