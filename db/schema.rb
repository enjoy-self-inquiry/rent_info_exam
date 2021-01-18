ActiveRecord::Schema.define(version: 2021_01_16_012810) do

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.string "address"
    t.integer "age"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string "rail"
    t.string "name"
    t.integer "time"
    t.integer "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_stations_on_property_id"
  end

end
