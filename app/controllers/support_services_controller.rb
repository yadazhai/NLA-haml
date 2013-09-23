class SupportServicesController < ApplicationController
	def new
		@support_service = SupportService.new
	end

	def edit
		@support_service = SupportService.find(params[:id])
	end

	def create
		@support_service = SupportService.new(support_service_params)

		if(@support_service.save)
			redirect_to change_fields_people_path
		else
			render action: 'new'
		end
	end

	def update
		@support_service = SupportService.find(params[:id])

		if(@support_service.update(support_service_params))
			redirect_to change_fields_people_path
		else
			render action: 'edit'
		end
	end

	private
	def support_service_params
		params.require(:support_service).permit!
	end
end