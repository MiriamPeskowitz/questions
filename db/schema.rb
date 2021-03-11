# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_17_192535) do

  create_table "questions", force: :cascade do |t|
    t.string "asker"
    t.string "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "responses", force: :cascade do |t|
    t.integer "question_id"
    t.string "responder"
    t.string "response"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_responses_on_question_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer "response_id"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["response_id"], name: "index_taggings_on_response_id"
  end

  add_foreign_key "responses", "questions"
  add_foreign_key "taggings", "responses"
end
