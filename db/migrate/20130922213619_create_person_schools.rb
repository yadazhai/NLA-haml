class CreatePersonSchools < ActiveRecord::Migration
  def change
    create_table :person_schools do |t|
      t.references :person, index: true
      t.references :school, index: true
      t.boolean :isCurrent

      t.timestamps
    end
  end
end
