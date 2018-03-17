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

ActiveRecord::Schema.define(version: 20180317155314) do

  create_table "academic_years", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applicant_exam_hubs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "applicant_id"
    t.bigint "exam_hub_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_applicant_exam_hubs_on_applicant_id"
    t.index ["exam_hub_id"], name: "index_applicant_exam_hubs_on_exam_hub_id"
  end

  create_table "applicant_services", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "applicant_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_applicant_services_on_applicant_id"
  end

  create_table "applicants", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "user_id"
    t.string "first_name"
    t.string "father_name"
    t.string "grand_father_name"
    t.string "gender"
    t.date "date_of_birth"
    t.string "place_of_birth"
    t.string "marital_status"
    t.bigint "region_id"
    t.string "city"
    t.string "pobox"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status"
    t.string "title"
    t.index ["region_id"], name: "index_applicants_on_region_id"
    t.index ["user_id"], name: "index_applicants_on_user_id"
  end

  create_table "attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "applicant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.string "cv_file_name"
    t.string "cv_content_type"
    t.integer "cv_file_size"
    t.datetime "cv_updated_at"
    t.string "motivation_letter_file_name"
    t.string "motivation_letter_content_type"
    t.integer "motivation_letter_file_size"
    t.datetime "motivation_letter_updated_at"
    t.string "sponsorship_letter_file_name"
    t.string "sponsorship_letter_content_type"
    t.integer "sponsorship_letter_file_size"
    t.datetime "sponsorship_letter_updated_at"
    t.index ["applicant_id"], name: "index_attachments_on_applicant_id"
  end

  create_table "events", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "academic_year_id"
    t.string "name"
    t.date "start_time"
    t.date "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_events_on_academic_year_id"
  end

  create_table "exam_hubs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.bigint "region_id"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["region_id"], name: "index_exam_hubs_on_region_id"
  end

  create_table "match_results", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "applicant_id"
    t.bigint "program_id"
    t.bigint "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_match_results_on_applicant_id"
    t.index ["program_id"], name: "index_match_results_on_program_id"
    t.index ["university_id"], name: "index_match_results_on_university_id"
  end

  create_table "program_choices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "applicant_id"
    t.integer "choice_order"
    t.bigint "program_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_id"], name: "index_program_choices_on_applicant_id"
    t.index ["program_id"], name: "index_program_choices_on_program_id"
  end

  create_table "program_quotas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "academic_year_id"
    t.bigint "program_id"
    t.bigint "university_id"
    t.integer "quota"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_year_id"], name: "index_program_quotas_on_academic_year_id"
    t.index ["program_id"], name: "index_program_quotas_on_program_id"
    t.index ["university_id"], name: "index_program_quotas_on_university_id"
  end

  create_table "programs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "applicant_service_id"
    t.string "institution"
    t.bigint "region_id"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applicant_service_id"], name: "index_services_on_applicant_service_id"
    t.index ["region_id"], name: "index_services_on_region_id"
  end

  create_table "universities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "university_choices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "program_choice_id"
    t.integer "choice_order"
    t.bigint "university_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_choice_id"], name: "index_university_choices_on_program_choice_id"
    t.index ["university_id"], name: "index_university_choices_on_university_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "applicant_exam_hubs", "applicants"
  add_foreign_key "applicant_exam_hubs", "exam_hubs"
  add_foreign_key "applicant_services", "applicants"
  add_foreign_key "applicants", "regions"
  add_foreign_key "applicants", "users"
  add_foreign_key "attachments", "applicants"
  add_foreign_key "events", "academic_years"
  add_foreign_key "exam_hubs", "regions"
  add_foreign_key "match_results", "applicants"
  add_foreign_key "match_results", "programs"
  add_foreign_key "match_results", "universities"
  add_foreign_key "program_choices", "applicants"
  add_foreign_key "program_choices", "programs"
  add_foreign_key "program_quotas", "academic_years"
  add_foreign_key "program_quotas", "programs"
  add_foreign_key "program_quotas", "universities"
  add_foreign_key "services", "applicant_services"
  add_foreign_key "services", "regions"
  add_foreign_key "university_choices", "program_choices"
  add_foreign_key "university_choices", "universities"
end
