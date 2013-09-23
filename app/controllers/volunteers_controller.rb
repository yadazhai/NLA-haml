class VolunteersController < ApplicationController

	def index
		@volunteers = Person.where(typeOfPerson: 'volunteer').order('lastName')
	end

	def show
	end

	def new
		@volunteer = Person.new
		@volunteer.typeOfPerson = 'volunteer'
		@volunteer.addresses.build
		@volunteer.phone_numbers.build
		@volunteer.emergency_contacts.build
		@volunteer.person_schools.build
		@volunteer.interests.build
	end

	def edit
		@volunteer = Person.find(params[:id])
	end
	
	def modify
		@volunteers = Person.where(typeOfPerson: 'volunteer').order('lastName')
	end

	private

	def volunteer_params
		params.require(:person).permit!
	end
end