class CreateProgramAttendances < ActiveRecord::Migration
  def change
    create_table :program_attendances do |t|
      t.references :program_enrollment, index: true
      t.date :date
      t.string :status
      t.string :comments

      t.timestamps
    end
  end
end
