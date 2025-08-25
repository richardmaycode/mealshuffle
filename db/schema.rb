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

ActiveRecord::Schema[8.0].define(version: 2025_08_24_204426) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "creators", force: :cascade do |t|
    t.string "display_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.integer "platform"
    t.string "handle"
    t.integer "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_locations_on_creator_id"
  end

  create_table "recipe_traits", force: :cascade do |t|
    t.integer "recipe_id", null: false
    t.integer "trait_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_traits_on_recipe_id"
    t.index ["trait_id"], name: "index_recipe_traits_on_trait_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", null: false
    t.integer "servings"
    t.integer "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_recipes_on_creator_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ip_address"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "shuffle_recipes", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.integer "position", default: 0, null: false
    t.integer "shuffle_id", null: false
    t.integer "recipe_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_shuffle_recipes_on_recipe_id"
    t.index ["shuffle_id"], name: "index_shuffle_recipes_on_shuffle_id"
  end

  create_table "shuffle_traits", force: :cascade do |t|
    t.integer "shuffle_id", null: false
    t.integer "trait_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shuffle_id"], name: "index_shuffle_traits_on_shuffle_id"
    t.index ["trait_id"], name: "index_shuffle_traits_on_trait_id"
  end

  create_table "shuffles", force: :cascade do |t|
    t.string "share_token", null: false
    t.boolean "saved_recipes", default: false
    t.datetime "expiration_date"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shuffles_on_user_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "url", null: false
    t.text "note"
    t.integer "recipe_id", null: false
    t.integer "creator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_sources_on_creator_id"
    t.index ["recipe_id"], name: "index_sources_on_recipe_id"
  end

  create_table "traits", force: :cascade do |t|
    t.string "name", null: false
    t.integer "category", default: 0, null: false
    t.integer "recipe_traits_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email_address", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_address"], name: "index_users_on_email_address", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "locations", "creators"
  add_foreign_key "recipe_traits", "recipes"
  add_foreign_key "recipe_traits", "traits"
  add_foreign_key "recipes", "users", column: "creator_id"
  add_foreign_key "sessions", "users"
  add_foreign_key "shuffle_recipes", "recipes"
  add_foreign_key "shuffle_recipes", "shuffles"
  add_foreign_key "shuffle_traits", "shuffles"
  add_foreign_key "shuffle_traits", "traits"
  add_foreign_key "shuffles", "users"
  add_foreign_key "sources", "creators"
  add_foreign_key "sources", "recipes"
end
