class Person < ActiveRecord::Base

#------------------- Setting up Many to Many Relationships ------------ #
	# Allergies
	has_many :person_allergies
	has_many :allergies, through: :person_allergies
	accepts_nested_attributes_for :person_allergies, allow_destroy: :true

	# Medications
	has_many :person_medications
	has_many :medications, through: :person_medications
	accepts_nested_attributes_for :person_medications, allow_destroy: :true

	# Support Services
	has_many :person_support_services
	has_many :support_services, through: :support_services
	accepts_nested_attributes_for :person_support_services, allow_destroy: :true

	# Interests
	has_many :person_interests
	has_many :interests, through: :person_interests
	accepts_nested_attributes_for :person_interests, allow_destroy: :true

	# Schools
	has_many :person_schools
	has_many :schools, through: :person_schools
	accepts_nested_attributes_for :person_schools, allow_destroy: :true

#------------------- Setting up One to Many Relationships ------------ #
	# Address
	has_many :addresses
	accepts_nested_attributes_for :addresses, allow_destroy: :true
	
	# Availability
	has_many :availabilities
	accepts_nested_attributes_for :availabilities, allow_destroy: :true

	# EmergencyContact
	has_many :emergency_contacts
	accepts_nested_attributes_for :emergency_contacts, allow_destroy: :true

	has_many :phone_numbers
	accepts_nested_attributes_for :phone_numbers, allow_destroy: :true

	has_many :program_enrollments
#------------------- Functions that return Person information -------- #
	# Ex. "Smith, John"
	def fullName
		"#{lastName}, #{firstName}"
	end

	def currentSchool
		aschool = PersonSchool.where(person_id: id).order('updated_at DESC').first.school

		if(aschool == nil)
			return ""
		end
		return aschool.name
	end
end