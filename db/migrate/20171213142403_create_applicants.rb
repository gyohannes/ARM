class CreateApplicants < ActiveRecord::Migration[5.1]
  def change
    create_table :applicants do |t|
      t.references :user, foreign_key: true
      t.string :first_name
      t.string :father_name
      t.string :grand_father_name
      t.string :gender
      t.date :date_of_birth
      t.string :place_of_birth
      t.string :marital_status

      # current address
      t.references :region, foreign_key: true
      t.string :city
      t.string :pobox
      t.string :phone

      t.timestamps
    end
  end
end
