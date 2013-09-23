class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :person, index: true
      t.string :streetAddress
      t.string :city
      t.string :state
      t.integer :zipCode
      t.boolean :isCurrent

      t.timestamps
    end
  end
end
