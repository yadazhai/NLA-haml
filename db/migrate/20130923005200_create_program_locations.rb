class CreateProgramLocations < ActiveRecord::Migration
  def change
    create_table :program_locations do |t|
      t.references :program, index: true
      t.string :name
      t.string :streetAddress
      t.string :city
      t.string :state
      t.string :zipCode

      t.timestamps
    end
  end
end
