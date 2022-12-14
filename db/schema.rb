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

ActiveRecord::Schema[7.0].define(version: 2022_12_06_150825) do
  create_table "distribution_data_carmillas", force: :cascade do |t|
    t.string "words"
    t.integer "frequency"
    t.float "ratio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "distribution_data_lovecrs", force: :cascade do |t|
    t.string "words"
    t.integer "frequency"
    t.float "ratio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tfz_id"
    t.index ["tfz_id"], name: "index_distribution_data_lovecrs_on_tfz_id"
  end

  create_table "lovecraft_zipf_ds", force: :cascade do |t|
    t.string "word"
    t.integer "frequency"
    t.float "ratio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "texts", force: :cascade do |t|
    t.string "text_name"
    t.string "text_author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "texts_for_zipfs", force: :cascade do |t|
    t.string "text_name"
    t.string "text_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
