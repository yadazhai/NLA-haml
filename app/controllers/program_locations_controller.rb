class ProgramLocationsController < ApplicationController
	def edit
		@program_location = ProgramLocation.find(params[:id])
		@program = Program.find(@program_location.program_id)
	end

	def show
		@program_location = ProgramLocation.find(params[:id])
		@enrolled_students = @program_location.people
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
		if(params[:program_attendances] != nil)
			atts = params[:program_attendances]
			atts.keys.each do |att|
				this_att = ProgramAttendance.find_by_id(att)
				if(this_att != nil)
		 			this_att.status = params[:program_attendances][att][:status]
		 			this_att.comments = params[:program_attendances][att][:comments]
		 			this_att.save
				end
			end
	  	end
	
		@program_location = ProgramLocation.find(params[:id])

		if(@program_location.update(program_location_params))
			redirect_to program_path(@program_location.program), notice: 'Program Location was successfully saved'
		else
			render action: 'edit'
		end
	end

	def attendance
		@program_location = ProgramLocation.find(params[:id])
		@program_enrollments = @program_location.program_enrollments

		@program_attendances = Array.new
		@program_enrollments.each do |enrollment|
			@program_attendances << ProgramAttendance.where(
				program_location_id: @program_location.id,
				date: Time.now.strftime("%Y-%m-%d"),
				person_id: enrollment.person.id).first_or_create
		end
	end

	private
	def program_location_params
		params.require(:program_location).permit!
	end
end