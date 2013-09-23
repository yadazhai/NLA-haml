class ProgramAttendance < ActiveRecord::Base
  belongs_to :program_enrollment
end
