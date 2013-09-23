class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.references :person, index: true
      t.integer :dayOfWeek
      t.integer :startTime
      t.integer :endTime

      t.timestamps
    end
  end
end
