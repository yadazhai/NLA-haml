class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def redirect_to_home(personType)
  	if(personType == "volunteer")
  		redirect_to volunteers_path
  	end
  	if(personType == "employee")
  		redirect_to employees_path
  	end
  	if(personType == "student")
  		redirect_to students_path
  	end
  end
end
