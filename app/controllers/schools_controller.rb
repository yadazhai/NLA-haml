class SchoolsController < ApplicationController
	def index
		@schools = School.all.order('name')
	end

	def show
	end

	def modify
		@schools = School.all.order('name')
	end
	
	def edit
		@school = School.find(params[:id])
	end

	def new
		@school = School.new
	end

	def create
		@school = School.new(school_params)

		if(@school.save)
			redirect_to schools_path, notice: 'School was successfully saved'
		else
			render action: 'new'
		end
	end

	def update
		@school = School.new(school_params)

		if(@school.update(school_params))
			redirect_to schools_path, notice: 'School was successfully saved'
		else
			render action: 'edit'
		end
	end

	private
	def set_school
		@school = School.find(params[:id])
	end

	def school_params
		params.require(:school).permit!
	end
end