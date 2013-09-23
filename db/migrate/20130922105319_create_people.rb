class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :firstName
      t.string :lastName
      t.boolean :gender
      t.date :dateOfBirth
      t.string :race
      t.string :email
      t.integer :numberOfMembersInHousehold
      t.boolean :inFosterCare
      t.integer :schoolLunchProgram
      t.string :clinicName
      t.string :clinicStreetAddress
      t.string :clinicCity
      t.string :clinicState
      t.string :clinicZipCode
      t.string :clinicPhoneNumber
      t.string :typeOfPerson
      t.boolean :isActive
      t.integer :grade
      t.string :otherFoodNeeds
      t.string :physicalImpairments
      t.string :comments
      t.string :tag
      t.string :parentName
      t.string :parentPhone
      t.string :parentEmail
      t.string :CAPAS

      t.timestamps
    end
  end
end
