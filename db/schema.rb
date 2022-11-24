# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_11_24_130504) do
  create_table "car_complaints", force: :cascade do |t|
    t.string "address"
    t.text "description"
    t.date "date"
    t.integer "registation_info_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registation_info_id"], name: "index_car_complaints_on_registation_info_id"
  end

  create_table "car_holder_infos", force: :cascade do |t|
    t.string "full_name"
    t.date "date_of_birth"
    t.date "date_of_car_license"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "car_infos", force: :cascade do |t|
    t.string "VIN"
    t.string "brand"
    t.string "model"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fines", force: :cascade do |t|
    t.date "date_of_recepeit"
    t.string "article"
    t.integer "amount"
    t.date "date_of_payment"
    t.integer "registation_info_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["registation_info_id"], name: "index_fines_on_registation_info_id"
  end

  create_table "registation_infos", force: :cascade do |t|
    t.string "state_number"
    t.date "date_of_registation"
    t.integer "car_holder_info_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "car_info_id", null: false
    t.index ["car_holder_info_id"], name: "index_registation_infos_on_car_holder_info_id"
    t.index ["car_info_id"], name: "index_registation_infos_on_car_info_id"
  end

  create_table "wanted_lists", force: :cascade do |t|
    t.text "description"
    t.integer "car_info_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "registation_info_id"
    t.index ["car_info_id"], name: "index_wanted_lists_on_car_info_id"
    t.index ["registation_info_id"], name: "index_wanted_lists_on_registation_info_id"
  end

  add_foreign_key "car_complaints", "registation_infos"
  add_foreign_key "fines", "registation_infos"
  add_foreign_key "registation_infos", "car_holder_infos"
  add_foreign_key "registation_infos", "car_infos"
  add_foreign_key "wanted_lists", "car_infos"
  add_foreign_key "wanted_lists", "registation_infos"
end
