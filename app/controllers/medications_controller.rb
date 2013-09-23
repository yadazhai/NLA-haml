class MedicationsController < ApplicationController
	def new
		@medication = Medication.new
	end

	def edit
		@medication = Medication.find(params[:id])
	end

	def create
		@medication = Medication.new(medication_params)

		if(@medication.save)
			redirect_to change_fields_people_path
		else
			render action: 'new'
		end
	end

	def update
		@medication = Medication.find(params[:id])

		if(@medication.update(medication_params))
			redirect_to change_fields_people_path
		else
			render action: 'edit'
		end
	end

	private
	def medication_params
		params.require(:medication).permit!
	end
end