class PeopleController < ApplicationController
	def index
		@people = Person.where(typeOfPerson: 'person').order('lastName')
	end

	def show
	end

	def new
		@person = Person.new
		@person.addresses.build
		@person.phone_numbers.build
		@person.emergency_contacts.build
		@person.person_schools.build
		@person.interests.build
	end

	def edit
		@person = Person.find(params[:id])
	end
	
	def modify
		@people = Person.where(typeOfPerson: 'person').order('lastName')
	end

	def update
		@person = Person.find(params[:id])
		if(@person.update(person_params))
			redirect_to_home(@person.typeOfPerson)
		else
			render 'edit'
		end
	end
	
	def create
		@person = Person.new(person_params)

		if(@person.save)
			redirect_to_home(@person.typeOfPerson)
		else
			render action: 'new'
		end
	end

	def destroy
		@person = Person.find(params[:id])
		@person.destroy		
		redirect_to_home(@person.typeOfPerson)
	end

	private

	def person_params
		params.require(:person).permit!
	end
end
