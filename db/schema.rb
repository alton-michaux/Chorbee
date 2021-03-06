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

ActiveRecord::Schema.define(version: 20_220_528_044_053) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'appointments', force: :cascade do |t|
    t.datetime 'start_time'
    t.datetime 'end_time'
    t.string   'frequency'
    t.boolean  'done?'
    t.integer  'chore_id'
    t.index ['chore_id'], name: 'index_appointments_on_chore_id', using: :btree
  end

  create_table 'children', force: :cascade do |t|
    t.string  'name'
    t.integer 'age'
    t.integer 'parent_id'
    t.index ['parent_id'], name: 'index_children_on_parent_id', using: :btree
  end

  create_table 'children_chores', id: false, force: :cascade do |t|
    t.integer 'chore_id', null: false
    t.integer 'child_id', null: false
  end

  create_table 'chores', force: :cascade do |t|
    t.string 'job'
    t.text   'description'
  end

  create_table 'parents', force: :cascade do |t|
    t.string   'name'
    t.string   'email',                  default: '', null: false
    t.string   'encrypted_password',     default: '', null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_parents_on_email', unique: true, using: :btree
    t.index ['reset_password_token'], name: 'index_parents_on_reset_password_token', unique: true, using: :btree
  end

  add_foreign_key 'appointments', 'chores'
  add_foreign_key 'children', 'parents'
end
