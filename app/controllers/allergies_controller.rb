class AllergiesController < ApplicationController
	def new
		@allergy = Allergy.new
	end

	def edit
		@allergy = Allergy.find(params[:id])
	end

	def create
		@allergy = Allergy.new(allergy_params)

		if(@allergy.save)
			redirect_to change_fields_people_path
		else
			render action: 'new'
		end
	end

	def update
		@allergy = Allergy.find(params[:id])

		if(@allergy.update(allergy_params))
			redirect_to change_fields_people_path
		else
			render action: 'edit'
		end
	end

	private
	def allergy_params
		params.require(:allergy).permit!
	end
end