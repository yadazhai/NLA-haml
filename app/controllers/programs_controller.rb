class ProgramsController < ApplicationController
	def index
		@programs = Program.all.order('name')
	end

	def show
		@program = Program.find(params[:id])
		@program_locations = @program.program_locations
	end

	def modify
		@programs = Program.all.order('name')
	end
	
	def edit
		@program = Program.find(params[:id])
	end

	def new
		@program = Program.new
	end

	def create
		@program = Program.new(program_params)

		if(@program.save)
			redirect_to programs_path, notice: 'Program was successfully saved'
		else
			render action: 'new'
		end
	end

	def update
		@program = Program.find(params[:id])

		if(@program.update(program_params))
			redirect_to programs_path, notice: 'Program was successfully saved'
		else
			render action: 'edit'
		end
	end

	def enroll_student
		@program = Program.find(params[:id])
		@students = Person.where(typeOfPerson: "student")
		@program_enrollment = ProgramEnrollment.new
		@program_locations = ProgramLocation.where(program_id: @program.id)
	end
	private
	def set_program
		@program = Program.find(params[:id])
	end

	def program_params
		params.require(:program).permit!
	end
end