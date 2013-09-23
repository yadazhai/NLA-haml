class InterestsController < ApplicationController
	def new
		@interest = Interest.new
	end

	def edit
		@interest = Interest.find(params[:id])
	end

	def create
		@interest = Interest.new(interest_params)

		if(@interest.save)
			redirect_to change_fields_people_path
		else
			render action: 'new'
		end
	end

	def update
		@interest = Interest.find(params[:id])

		if(@interest.update(interest_params))
			redirect_to change_fields_people_path
		else
			render action: 'edit'
		end
	end

	private
	def interest_params
		params.require(:interest).permit!
	end
end