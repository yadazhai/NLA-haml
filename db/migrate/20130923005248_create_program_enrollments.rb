class CreateProgramEnrollments < ActiveRecord::Migration
  def change
    create_table :program_enrollments do |t|
      t.references :program_location, index: true
      t.references :person, index: true

      t.timestamps
    end
  end
end
