# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20130923005520) do

  create_table "addresses", force: true do |t|
    t.integer  "person_id"
    t.string   "streetAddress"
    t.string   "city"
    t.string   "state"
    t.integer  "zipCode"
    t.boolean  "isCurrent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["person_id"], name: "index_addresses_on_person_id", using: :btree

  create_table "allergies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "availabilities", force: true do |t|
    t.integer  "person_id"
    t.integer  "dayOfWeek"
    t.integer  "startTime"
    t.integer  "endTime"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "availabilities", ["person_id"], name: "index_availabilities_on_person_id", using: :btree

  create_table "emergency_contacts", force: true do |t|
    t.integer  "person_id"
    t.string   "name"
    t.string   "phone"
    t.string   "relationship"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emergency_contacts", ["person_id"], name: "index_emergency_contacts_on_person_id", using: :btree

  create_table "interests", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "medications", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "people", force: true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.boolean  "gender"
    t.date     "dateOfBirth"
    t.string   "race"
    t.string   "email"
    t.integer  "numberOfMembersInHousehold"
    t.boolean  "inFosterCare"
    t.integer  "schoolLunchProgram"
    t.string   "clinicName"
    t.string   "clinicStreetAddress"
    t.string   "clinicCity"
    t.string   "clinicState"
    t.string   "clinicZipCode"
    t.string   "clinicPhoneNumber"
    t.string   "typeOfPerson"
    t.boolean  "isActive"
    t.integer  "grade"
    t.string   "otherFoodNeeds"
    t.string   "physicalImpairments"
    t.string   "comments"
    t.string   "tag"
    t.string   "parentName"
    t.string   "parentPhone"
    t.string   "CAPAS"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "parentEmail"
  end

  create_table "person_allergies", force: true do |t|
    t.integer  "person_id"
    t.integer  "allergy_id"
    t.integer  "severity"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "person_allergies", ["allergy_id"], name: "index_person_allergies_on_allergy_id", using: :btree
  add_index "person_allergies", ["person_id"], name: "index_person_allergies_on_person_id", using: :btree

  create_table "person_interests", force: true do |t|
    t.integer  "person_id"
    t.integer  "interest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "person_interests", ["interest_id"], name: "index_person_interests_on_interest_id", using: :btree
  add_index "person_interests", ["person_id"], name: "index_person_interests_on_person_id", using: :btree

  create_table "person_medications", force: true do |t|
    t.integer  "person_id"
    t.integer  "medication_id"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "person_medications", ["medication_id"], name: "index_person_medications_on_medication_id", using: :btree
  add_index "person_medications", ["person_id"], name: "index_person_medications_on_person_id", using: :btree

  create_table "person_schools", force: true do |t|
    t.integer  "person_id"
    t.integer  "school_id"
    t.boolean  "isCurrent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "person_schools", ["person_id"], name: "index_person_schools_on_person_id", using: :btree
  add_index "person_schools", ["school_id"], name: "index_person_schools_on_school_id", using: :btree

  create_table "person_support_services", force: true do |t|
    t.integer  "person_id"
    t.integer  "support_service_id"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "person_support_services", ["person_id"], name: "index_person_support_services_on_person_id", using: :btree
  add_index "person_support_services", ["support_service_id"], name: "index_person_support_services_on_support_service_id", using: :btree

  create_table "phone_numbers", force: true do |t|
    t.integer  "person_id"
    t.string   "phone"
    t.string   "typeOfPhone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "phone_numbers", ["person_id"], name: "index_phone_numbers_on_person_id", using: :btree

  create_table "program_attendances", force: true do |t|
    t.integer  "program_enrollment_id"
    t.date     "date"
    t.string   "status"
    t.string   "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "program_attendances", ["program_enrollment_id"], name: "index_program_attendances_on_program_enrollment_id", using: :btree

  create_table "program_enrollments", force: true do |t|
    t.integer  "program_location_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "program_enrollments", ["person_id"], name: "index_program_enrollments_on_person_id", using: :btree
  add_index "program_enrollments", ["program_location_id"], name: "index_program_enrollments_on_program_location_id", using: :btree

  create_table "program_locations", force: true do |t|
    t.integer  "program_id"
    t.string   "name"
    t.string   "streetAddress"
    t.string   "city"
    t.string   "state"
    t.string   "zipCode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "program_locations", ["program_id"], name: "index_program_locations_on_program_id", using: :btree

  create_table "programs", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "cohort"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "support_services", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
