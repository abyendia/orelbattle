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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130326191413) do

  create_table "buttles", :force => true do |t|
    t.integer  "opponent_1"
    t.integer  "opponent_2"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "opp_voice_vk_1", :default => 0
    t.integer  "opp_voice_vk_2", :default => 0
  end

  create_table "cooks", :force => true do |t|
    t.string   "cook_key"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lots", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "url_message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
  end

end
