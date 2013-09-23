class ProgramEnrollmentsController < ApplicationController
	def create
		@program_enrollment = ProgramEnrollment.new(program_enrollment_params)

		if(@program_enrollment.save)
			redirect_to program_location_path(@program_enrollment.program_location), notice: 'Program Location was successfully saved'
		else
			render action: 'new'
		end
	end

	def update
		@program_enrollment = ProgramEnrollment.find(params[:id])

		if(@program_enrollment.update(program_enrollment_params))
			redirect_to program_location_path(@program_enrollment.program_location), notice: 'Program Location was successfully saved'
		else
			render action: 'edit'
		end
	end

	def destroy
		@program_enrollment = ProgramEnrollment.where(program_location_id: params[:program_location]).where(person_id: params[:student]).first
		@program_enrollment.destroy		
		redirect_to program_location_path(@program_enrollment.program_location)
	end

	private
	def program_enrollment_params
		params.require(:program_enrollment).permit!
	end
end