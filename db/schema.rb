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

ActiveRecord::Schema[7.2].define(version: 2022_05_28_044053) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", id: :serial, force: :cascade do |t|
    t.datetime "start_time", precision: nil
    t.datetime "end_time", precision: nil
    t.string "frequency"
    t.boolean "done?"
    t.integer "chore_id"
    t.index ["chore_id"], name: "index_appointments_on_chore_id"
  end

  create_table "children", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.integer "parent_id"
    t.index ["parent_id"], name: "index_children_on_parent_id"
  end

  create_table "children_chores", id: false, force: :cascade do |t|
    t.integer "chore_id", null: false
    t.integer "child_id", null: false
    t.index ["child_id", "chore_id"], name: "index_children_chores_on_child_id_and_chore_id"
    t.index ["chore_id", "child_id"], name: "index_children_chores_on_chore_id_and_child_id"
  end

  create_table "chores", id: :serial, force: :cascade do |t|
    t.string "job"
    t.text "description"
  end

  create_table "parents", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.index ["email"], name: "index_parents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_parents_on_reset_password_token", unique: true
  end

  add_foreign_key "appointments", "chores"
  add_foreign_key "children", "parents"
end
