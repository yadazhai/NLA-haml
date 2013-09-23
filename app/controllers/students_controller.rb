class StudentsController < ApplicationController

	def index
		@students = Person.where(typeOfPerson: 'student').order('lastName')
	end

	def show
	end

	def new
		@student = Person.new
		@student.addresses.build
		@student.phone_numbers.build
		@student.emergency_contacts.build
		@student.person_schools.build
	end

	def edit
		@student = Person.find(params[:id])
	end
	
	def modify
		@students = Person.where(typeOfPerson: 'student').order('lastName')
	end

	private

	def student_params
		params.require(:person).permit!
	end
end