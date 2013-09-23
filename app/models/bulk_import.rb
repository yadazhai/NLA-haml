class BulkImport
  include ActiveModel::Model
  extend ActiveModel::Naming

  attr_accessor :file
  def persisted?
    false
  end

  def save
    if (imported_people.map(&:valid?).all? && !errors.any?)
        imported_people.each(&:save!)

        true
    else
      imported_people.each_with_index do |person, index|
        person.errors.full_messages.each do |message|
          errors.add :base, "Row #{index+2}: #{message}"
        end
      end
      false
    end
  end

  def imported_people
    @imported_people ||= load_imported_people
    return @imported_people
  end

  def load_imported_people
    spreadsheet = open_spreadsheet
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).map do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      person = Person.find_by_id(row["id"]) || Person.new

      if(row.has_key?("school_name"))
        if(School.where(:name => row["school_name"]).any?)
          school = School.where(:name => row["school_name"]).first
          person.schools << school
        else
          errors.add :base, "Row #{i}: School Name is invalid"
        end
      end

      if(row.has_key?("allergy_1"))
        allergies = Allergy.where(:name => row["allergy_1"])
        if(allergies.any?)
          allergy = allergies.first
          person.allergies << allergy
        elsif (row["allergy_1"] == nil)
          errors.add :base, "Row #{i}: Allergy 1 Name is invalid"
        end
      end

      if(row.has_key?("allergy_2"))
        allergies = Allergy.where(:name => row["allergy_2"])
        if(allergies.any?)
          allergy = allergies.first
          person.allergies << allergy
        elsif (row["allergy_2"] == nil)
          errors.add :base, "Row #{i}: Allergy 2 Name is invalid"
        end
      end
      if(row.has_key?("medication_1"))
        medications = Medication.where(:name => row["medication_1"])
        if(medications.any?)
          medication = medications.first
          person.medications << medication
        elsif (row["medication_1"] == nil)
          errors.add :base, "Row #{i}: Medication 1 Name is invalid"
        end
      end

      if(row.has_key?("medication_2"))
        medications = Medication.where(:name => row["medication_2"])
        if(medications.any?)
          medication = medications.first
          person.medications << medication
        elsif (row["medication_2"] == nil)
          errors.add :base, "Row #{i}: Medication 2 Name is invalid"
        end
      end

      if(row.has_key?("support_service_1"))
        support_services = SupportService.where(:name => row["support_service_1"])
        if(support_services.any?)
          support_service  = support_services.first
          person.support_services << support_service
        elsif (row["support_service_1"] == nil)
          errors.add :base , "Row #{i}: Support Service 1 Name is invalid"
        end
      end

      if(row.has_key?("support_service_2"))
        support_services = SupportService.where(:name => row["support_service_2"])
        if(support_services.any?)
          support_service  = support_services.first
          person.support_services << support_service
        elsif (row["support_service_2"] == nil)
          errors.add :base , "Row #{i}: Support Service 2 Name is invalid"
        end
      end

      if(row.has_key?("gender"))
        if(row["gender"] == 'male')
          row["gender"] = true
        elsif row["gender"] == 'female'
          row["gender"] = false
        end
      end

      if(row.has_key?("phone"))
        if(row["phone"] != nil)
          phone = PhoneNumber.new
          phone.phone = row[:phone]
          phone.typeOfPhone = row[:phone_number_type]        
          person.phone_numbers << phone
        end
      end

      # if(row.has_key?("afterschool_program_location"))
      #   if(ProgramLocation.where(:program_id => 3, :name => row["afterschool_program_location"]).any?)
      #     p_location = ProgramLocation.where(:program_id => 3, :name => row["afterschool_program_location"]).first
      #     p_enrollment = ProgramEnrollment.new
      #     p_enrollment.program_location = p_location
      #     person.program_enrollments << p_enrollment
      #   elsif (row["afterschool_program_location"] != nil)
      #     errors.add :base, "Row #{i}: AfterSchool Program Location Name is invalid"
      #   end
      # end

      if(row.has_key?("street_address"))
          address = Address.new
          address.streetAddress = row["street_address"]
          address.city = row["city"]
          address.state = row["state"]
          address.zipCode = row["zip_code"]
          if(!address.blank?)
            person.addresses << address
          end
      end

      if(row.has_key?("first_name") && row.has_key?("last_name"))
        person.firstName = row["first_name"]
        person.lastName = row["last_name"]
      else
        errors.add :base , "Row #{i}: Must include name"
      end

      if(row.has_key?("DOB"))
        person.dateOfBirth = row["DOB"]
      end

      if(row.has_key?("race"))
        person.race = row["race"]
      end

      puts person.attributes
      person.typeOfPerson = 'student'
      person
    end
  end

  def open_spreadsheet
    case File.extname(file.original_filename)
    when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
    when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end