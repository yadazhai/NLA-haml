class Allergy < ActiveRecord::Base
	has_many :person_allergies
	has_many :people, through: :person_allergies
end
