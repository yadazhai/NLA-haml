class EmployeesController < ApplicationController

	def index
		@employees = Person.where(typeOfPerson: 'employee').order('lastName')
	end

	def show
	end

	def new
		@employee = Person.new
		@employee.typeOfPerson = 'employee'
		@employee.addresses.build
		@employee.phone_numbers.build
		@employee.emergency_contacts.build
		@employee.person_schools.build
	end

	def edit
		@employee = Person.find(params[:id])
	end
	
	def modify
		@employees = Person.where(typeOfPerson: 'employee').order('lastName')
	end

	private
	def employee_params
		params.require(:person).permit!
	end
end