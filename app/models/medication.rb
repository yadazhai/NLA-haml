class Medication < ActiveRecord::Base
	has_many :person_medications
	has_many :people, through: :person_medications
end
