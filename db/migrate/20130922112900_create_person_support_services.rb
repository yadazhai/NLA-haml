class CreatePersonSupportServices < ActiveRecord::Migration
  def change
    create_table :person_support_services do |t|
      t.references :person, index: true
      t.references :support_service, index: true
      t.string :comments

      t.timestamps
    end
  end
end
