class ProgramLocation < ActiveRecord::Base
  belongs_to :program
  has_many :program_enrollments
  has_many :people, through: :program_enrollments
  has_many :program_attendances
  accepts_nested_attributes_for :program_attendances
end
