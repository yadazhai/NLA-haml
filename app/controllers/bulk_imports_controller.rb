class BulkImportsController < ApplicationController
  def step1
    @bulk_import = BulkImport.new
  end

  def step2
    @bulk_import = BulkImport.new
    @bulk_import.file = params[:bulk_import][:file]
    # @bulk_import.all_valid = true
    if @bulk_import.save
      redirect_to '/', notice: "Imported products successfully."
    else
      render :step1
    end
  end

end