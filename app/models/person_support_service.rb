class PersonSupportService < ActiveRecord::Base
  belongs_to :person
  belongs_to :support_service
end
