class ProgramLocationsController < ApplicationController
	def edit
		@program_location = ProgramLocation.find(params[:id])
		@program = Program.find(@program_location.program_id)
	end

	def new
		@program_location = ProgramLocation.new
		@program = Program.where(name: params[:program_name]).first
	end

	def create
		@program_location = ProgramLocation.new(program_location_params)

		if(@program_location.save)
			redirect_to program_path(@program_location.program), notice: 'Program Location was successfully saved'
		else
			render action: 'new'
		end
	end

	def update
		@program_location = ProgramLocation.find(params[:id])

		if(@program_location.update(program_location_params))
			redirect_to program_path(@program_location.program), notice: 'Program Location was successfully saved'
		else
			render action: 'edit'
		end
	end

	private
	def program_location_params
		params.require(:program_location).permit!
	end
end