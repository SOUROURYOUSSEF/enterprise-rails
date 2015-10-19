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

ActiveRecord::Schema.define(version: 20151016203137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.integer "entity_id"
    t.string  "entity_type", limit: 255
    t.integer "event_id"
  end

  add_index "activities", ["entity_id", "entity_type"], name: "index_activities_on_entity_id_and_entity_type", using: :btree
  add_index "activities", ["event_id"], name: "index_activities_on_event_id", using: :btree

  create_table "application_classes", force: :cascade do |t|
    t.string   "name",              limit: 255, null: false
    t.string   "description",       limit: 255
    t.integer  "parent_class_id"
    t.string   "parent_class_name", limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "application_classes", ["name"], name: "index_application_classes_on_name", unique: true, using: :btree

  create_table "application_objects", force: :cascade do |t|
    t.integer  "instance_id",                      null: false
    t.integer  "parent_class_id"
    t.string   "parent_class_name",    limit: 255
    t.integer  "permissions_mask"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "application_scope_id"
    t.integer  "application_class_id"
    t.integer  "user_id"
  end

  add_index "application_objects", ["application_class_id"], name: "index_application_objects_on_application_class_id", using: :btree
  add_index "application_objects", ["application_scope_id"], name: "index_application_objects_on_application_scope_id", using: :btree
  add_index "application_objects", ["user_id"], name: "index_application_objects_on_user_id", using: :btree

  create_table "application_scopes", force: :cascade do |t|
    t.string   "name",              limit: 255, null: false
    t.integer  "parent_class_id"
    t.string   "parent_class_name", limit: 255
    t.text     "description"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "group_id"
  end

  add_index "application_scopes", ["group_id"], name: "index_application_scopes_on_group_id", using: :btree

  create_table "associated_datasets", force: :cascade do |t|
    t.integer  "dataset_id"
    t.integer  "workspace_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "legacy_id",    limit: 255
    t.datetime "deleted_at"
  end

  add_index "associated_datasets", ["dataset_id", "workspace_id"], name: "index_associated_datasets_on_dataset_id_and_workspace_id", using: :btree

  create_table "attachments", force: :cascade do |t|
    t.integer  "note_id"
    t.string   "contents_file_name",    limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "contents_content_type", limit: 255
    t.integer  "contents_file_size"
    t.datetime "contents_updated_at"
    t.string   "legacy_id",             limit: 255
  end

  add_index "attachments", ["note_id"], name: "index_attachments_on_note_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.integer  "author_id"
    t.text     "body"
    t.integer  "event_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "legacy_id",  limit: 255
    t.datetime "deleted_at"
  end

  add_index "comments", ["event_id", "deleted_at"], name: "index_comments_on_event_id_and_deleted_at", using: :btree
  add_index "comments", ["event_id"], name: "index_comments_on_event_id", using: :btree

  create_table "csv_files", force: :cascade do |t|
    t.integer  "workspace_id"
    t.string   "contents_file_name",    limit: 255
    t.string   "contents_content_type", limit: 255
    t.integer  "contents_file_size"
    t.datetime "contents_updated_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.boolean  "has_header"
    t.text     "column_names"
    t.text     "types"
    t.string   "to_table",              limit: 255
    t.string   "delimiter",             limit: 255
    t.integer  "user_id"
    t.boolean  "new_table"
    t.boolean  "truncate",                          default: false
    t.boolean  "user_uploaded",                     default: true
    t.integer  "import_id"
  end

  add_index "csv_files", ["workspace_id"], name: "index_csv_files_on_workspace_id", using: :btree

  create_table "dashboard_items", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",       limit: 255
    t.integer  "location"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "options",    limit: 255, default: "", null: false
  end

  create_table "data_source_account_permissions", force: :cascade do |t|
    t.integer "accessed_id",                        null: false
    t.integer "data_source_account_id",             null: false
    t.string  "accessed_type",          limit: 255, null: false
  end

  add_index "data_source_account_permissions", ["accessed_id", "accessed_type"], name: "index_instance_account_permissions_on_accessed", using: :btree
  add_index "data_source_account_permissions", ["accessed_id"], name: "index_databases_instance_accounts_on_database_id", using: :btree
  add_index "data_source_account_permissions", ["data_source_account_id"], name: "index_instance_account_permissions_on_instance_account_id", using: :btree

  create_table "data_source_accounts", force: :cascade do |t|
    t.string   "db_username",           limit: 256
    t.integer  "data_source_id",                    null: false
    t.integer  "owner_id",                          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "legacy_id",             limit: 255
    t.string   "encrypted_db_password", limit: 255
    t.boolean  "invalid_credentials"
  end

  add_index "data_source_accounts", ["data_source_id"], name: "index_instance_accounts_on_data_source_id", using: :btree
  add_index "data_source_accounts", ["owner_id"], name: "index_instance_accounts_on_owner_id", using: :btree

  create_table "data_sources", force: :cascade do |t|
    t.string   "name",            limit: 256
    t.text     "description"
    t.string   "host",            limit: 256
    t.integer  "port"
    t.string   "db_name",         limit: 256
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "owner_id",                                       null: false
    t.boolean  "shared",                      default: false
    t.string   "version",         limit: 256
    t.string   "state",           limit: 255, default: "online"
    t.string   "legacy_id",       limit: 255
    t.datetime "last_checked_at"
    t.datetime "last_online_at"
    t.datetime "deleted_at"
    t.string   "type",            limit: 255
    t.boolean  "is_hawq"
    t.boolean  "ssl",                         default: false
  end

  add_index "data_sources", ["deleted_at", "id"], name: "index_data_sources_on_deleted_at_and_id", using: :btree
  add_index "data_sources", ["owner_id"], name: "index_data_sources_on_owner_id", using: :btree

  create_table "databases", force: :cascade do |t|
    t.integer  "data_source_id",             null: false
    t.string   "name",           limit: 256
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.datetime "stale_at"
    t.datetime "deleted_at"
    t.string   "type",           limit: 255, null: false
  end

  add_index "databases", ["data_source_id", "name"], name: "index_databases_on_data_source_id_and_name", unique: true, using: :btree
  add_index "databases", ["data_source_id"], name: "index_databases_on_data_source_id", using: :btree
  add_index "databases", ["deleted_at", "id"], name: "index_gpdb_databases_on_deleted_at_and_id", using: :btree

  create_table "datasets", force: :cascade do |t|
    t.string   "type",                limit: 256
    t.string   "name",                limit: 256
    t.integer  "schema_id"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "master_table",                    default: false
    t.datetime "stale_at"
    t.text     "query"
    t.string   "legacy_id",           limit: 255
    t.string   "edc_workspace_id",    limit: 255
    t.datetime "deleted_at"
    t.integer  "workspace_id"
    t.integer  "hdfs_data_source_id"
  end

  add_index "datasets", ["deleted_at", "id"], name: "index_datasets_on_deleted_at_and_id", using: :btree
  add_index "datasets", ["name", "schema_id", "type"], name: "index_datasets_on_name_schema_id_and_type", unique: true, using: :btree
  add_index "datasets", ["schema_id"], name: "index_database_objects_on_schema_id", using: :btree

  create_table "datasets_notes", force: :cascade do |t|
    t.integer "dataset_id"
    t.integer "note_id"
    t.string  "legacy_id",  limit: 255
  end

  create_table "events", force: :cascade do |t|
    t.string   "action",          limit: 255
    t.integer  "actor_id"
    t.integer  "target1_id"
    t.string   "target1_type",    limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "target2_type",    limit: 255
    t.integer  "target2_id"
    t.text     "additional_data"
    t.integer  "workspace_id"
    t.datetime "deleted_at"
    t.string   "legacy_id",       limit: 255
    t.string   "legacy_type",     limit: 255
    t.boolean  "insight",                     default: false
    t.integer  "promoted_by_id"
    t.datetime "promotion_time"
    t.boolean  "published",                   default: false
    t.string   "target3_type",    limit: 255
    t.integer  "target3_id"
  end

  add_index "events", ["id", "action", "deleted_at"], name: "index_events_on_id_and_action_and_deleted_at", using: :btree
  add_index "events", ["id", "action"], name: "index_events_on_id_and_action", using: :btree
  add_index "events", ["id", "deleted_at"], name: "index_events_on_id_and_deleted_at", using: :btree
  add_index "events", ["workspace_id"], name: "index_events_on_workspace_id", using: :btree

  create_table "gnip_data_sources", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.integer  "owner_id"
    t.string   "username",    limit: 255
    t.string   "password",    limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "stream_url",  limit: 255
    t.datetime "deleted_at"
  end

  add_index "gnip_data_sources", ["deleted_at", "id"], name: "index_gnip_data_sources_on_deleted_at_and_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "groups_roles", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "role_id",  null: false
  end

  add_index "groups_roles", ["group_id", "role_id"], name: "index_groups_roles_on_group_id_and_role_id", using: :btree
  add_index "groups_roles", ["role_id", "group_id"], name: "index_groups_roles_on_role_id_and_group_id", using: :btree

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "user_id",  null: false
  end

  add_index "groups_users", ["group_id", "user_id"], name: "index_groups_users_on_group_id_and_user_id", using: :btree
  add_index "groups_users", ["user_id", "group_id"], name: "index_groups_users_on_user_id_and_group_id", using: :btree

  create_table "hdfs_data_sources", force: :cascade do |t|
    t.string   "name",                  limit: 256
    t.text     "description"
    t.string   "host",                  limit: 255,                    null: false
    t.integer  "port"
    t.integer  "owner_id",                                             null: false
    t.string   "version",               limit: 256
    t.string   "username",              limit: 256
    t.string   "group_list",            limit: 256
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "legacy_id",             limit: 255
    t.datetime "last_checked_at"
    t.datetime "last_online_at"
    t.string   "state",                 limit: 255, default: "online", null: false
    t.datetime "deleted_at"
    t.string   "job_tracker_host",      limit: 255
    t.integer  "job_tracker_port"
    t.string   "hdfs_version",          limit: 255
    t.boolean  "high_availability",                 default: false
    t.text     "connection_parameters"
  end

  add_index "hdfs_data_sources", ["deleted_at", "id"], name: "index_hdfs_data_sources_on_deleted_at_and_id", using: :btree
  add_index "hdfs_data_sources", ["owner_id"], name: "index_hdfs_data_sources_on_owner_id", using: :btree

  create_table "hdfs_entries", force: :cascade do |t|
    t.string   "path",                limit: 4096
    t.integer  "hdfs_data_source_id"
    t.datetime "modified_at"
    t.integer  "size",                limit: 8
    t.boolean  "is_directory"
    t.integer  "content_count"
    t.integer  "parent_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.datetime "stale_at"
    t.string   "legacy_id",           limit: 255
    t.datetime "deleted_at"
  end

  add_index "hdfs_entries", ["deleted_at", "id"], name: "index_hdfs_entries_on_deleted_at_and_id", using: :btree
  add_index "hdfs_entries", ["hdfs_data_source_id", "path"], name: "index_hdfs_entries_on_hadoop_instance_id_and_path", unique: true, using: :btree

  create_table "hdfs_imports", force: :cascade do |t|
    t.integer  "hdfs_entry_id"
    t.integer  "user_id"
    t.integer  "upload_id"
    t.string   "file_name",     limit: 255
    t.boolean  "success"
    t.datetime "finished_at"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "import_templates", force: :cascade do |t|
    t.integer  "destination_id"
    t.integer  "source_id"
    t.string   "destination_name", limit: 255
    t.boolean  "truncate"
    t.integer  "row_limit"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "imports", force: :cascade do |t|
    t.integer  "import_schedule_id"
    t.datetime "finished_at"
    t.datetime "created_at"
    t.integer  "workspace_id"
    t.string   "to_table",               limit: 255
    t.integer  "source_id"
    t.boolean  "truncate"
    t.boolean  "new_table"
    t.integer  "user_id"
    t.integer  "sample_count"
    t.text     "file_name"
    t.boolean  "success"
    t.integer  "destination_dataset_id"
    t.string   "legacy_id",              limit: 255
    t.datetime "started_at"
    t.string   "type",                   limit: 255, null: false
    t.integer  "schema_id"
    t.string   "source_type",            limit: 255
    t.datetime "canceled_at"
    t.string   "cancel_message",         limit: 255
  end

  create_table "job_results", force: :cascade do |t|
    t.integer  "job_id"
    t.datetime "started_at"
    t.datetime "finished_at"
    t.boolean  "succeeded"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "job_subscriptions", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.integer  "job_id",                 null: false
    t.string   "condition",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "job_subscriptions", ["job_id", "condition", "user_id"], name: "index_job_subscriptions_on_job_id_and_condition_and_user_id", using: :btree

  create_table "job_task_results", force: :cascade do |t|
    t.integer  "job_result_id"
    t.string   "name",              limit: 255
    t.datetime "started_at"
    t.datetime "finished_at"
    t.string   "status",            limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "message"
    t.string   "payload_result_id", limit: 255
    t.integer  "payload_id"
    t.string   "type",              limit: 255
  end

  create_table "job_tasks", force: :cascade do |t|
    t.integer  "index"
    t.datetime "deleted_at"
    t.integer  "job_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "type",              limit: 255
    t.integer  "payload_id"
    t.string   "payload_type",      limit: 255
    t.string   "status",            limit: 255
    t.string   "payload_result_id", limit: 255
    t.string   "killable_id",       limit: 255
  end

  create_table "jobs", force: :cascade do |t|
    t.text     "name"
    t.boolean  "enabled"
    t.integer  "workspace_id"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.datetime "deleted_at"
    t.datetime "next_run"
    t.datetime "last_run"
    t.string   "interval_unit",  limit: 255
    t.integer  "interval_value"
    t.datetime "end_run"
    t.string   "time_zone",      limit: 255, default: "Alaska"
    t.string   "status",         limit: 255, default: "idle"
    t.integer  "owner_id"
    t.string   "success_notify", limit: 255, default: "nobody"
    t.string   "failure_notify", limit: 255, default: "nobody"
  end

  add_index "jobs", ["workspace_id"], name: "index_jobs_on_workspace_id", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id",                  null: false
    t.integer  "workspace_id",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "legacy_id",    limit: 255
  end

  add_index "memberships", ["user_id", "workspace_id"], name: "index_memberships_on_user_id_and_workspace_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree
  add_index "memberships", ["workspace_id"], name: "index_memberships_on_workspace_id", using: :btree

  create_table "milestones", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "state",        limit: 255
    t.date     "target_date"
    t.integer  "workspace_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "milestones", ["workspace_id"], name: "index_milestones_on_workspace_id", using: :btree

  create_table "notes_work_flow_results", force: :cascade do |t|
    t.string  "result_id", limit: 255
    t.integer "note_id"
  end

  create_table "notes_workfiles", force: :cascade do |t|
    t.integer "note_id"
    t.integer "workfile_id"
    t.string  "legacy_id",   limit: 255
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "recipient_id"
    t.integer  "event_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "read",                     default: false, null: false
    t.string   "legacy_id",    limit: 255
    t.integer  "comment_id"
    t.datetime "deleted_at"
  end

  create_table "open_workfile_events", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "workfile_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "operations", force: :cascade do |t|
    t.string   "name",                 limit: 255, null: false
    t.text     "description"
    t.integer  "sequence"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "application_class_id"
  end

  add_index "operations", ["application_class_id"], name: "index_operations_on_application_class_id", using: :btree

  create_table "permissions", force: :cascade do |t|
    t.integer  "permissions_mask",     null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "role_id"
    t.integer  "application_class_id"
  end

  add_index "permissions", ["application_class_id"], name: "index_permissions_on_application_class_id", using: :btree
  add_index "permissions", ["role_id"], name: "index_permissions_on_role_id", using: :btree

  create_table "queue_classic_jobs", force: :cascade do |t|
    t.string   "q_name",    limit: 255
    t.string   "method",    limit: 255
    t.text     "args"
    t.datetime "locked_at"
  end

  add_index "queue_classic_jobs", ["q_name", "id"], name: "idx_qc_on_name_only_unlocked", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "roles_users", id: false, force: :cascade do |t|
    t.integer "role_id", null: false
    t.integer "user_id", null: false
  end

  add_index "roles_users", ["role_id", "user_id"], name: "index_roles_users_on_role_id_and_user_id", using: :btree
  add_index "roles_users", ["user_id", "role_id"], name: "index_roles_users_on_user_id_and_role_id", using: :btree

  create_table "schemas", force: :cascade do |t|
    t.string   "name",                          limit: 256
    t.integer  "parent_id",                                             null: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.integer  "active_tables_and_views_count",             default: 0
    t.datetime "stale_at"
    t.datetime "refreshed_at"
    t.datetime "deleted_at"
    t.string   "parent_type",                   limit: 255,             null: false
    t.string   "type",                          limit: 255,             null: false
  end

  add_index "schemas", ["deleted_at", "id"], name: "index_schemas_on_deleted_at_and_id", using: :btree
  add_index "schemas", ["name", "parent_id", "parent_type"], name: "index_schemas_on_name_and_parent_id_and_parent_type", unique: true, using: :btree
  add_index "schemas", ["parent_id"], name: "index_gpdb_schemas_on_database_id", using: :btree

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 40
    t.integer  "user_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", unique: true, using: :btree

  create_table "system_statuses", force: :cascade do |t|
    t.boolean  "expired",                          default: false
    t.boolean  "user_count_exceeded",              default: false
    t.string   "message",             limit: 2048
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  create_table "tableau_workbook_publications", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.integer  "dataset_id"
    t.integer  "workspace_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "project_name",               limit: 255
    t.integer  "linked_tableau_workfile_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id"
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "tag_id"], name: "index_taggings_on_taggable_id_and_taggable_type_and_tag_id", unique: true, using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count",             default: 0, null: false
  end

  create_table "uploads", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "contents_file_name"
    t.text     "contents_content_type"
    t.integer  "contents_file_size"
    t.datetime "contents_updated_at"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",             limit: 255,                 null: false
    t.string   "last_name",              limit: 255,                 null: false
    t.string   "username",               limit: 255
    t.string   "email",                  limit: 255,                 null: false
    t.string   "title",                  limit: 255
    t.string   "department",             limit: 255
    t.text     "notes"
    t.string   "password_digest",        limit: 255
    t.boolean  "admin",                              default: false
    t.datetime "deleted_at"
    t.string   "image_file_path",        limit: 255
    t.string   "image_content_type",     limit: 255
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "password_salt",          limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["first_name", "last_name"], name: "index_users_on_first_name_and_last_name", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "workfile_drafts", force: :cascade do |t|
    t.integer  "workfile_id",              null: false
    t.integer  "base_version"
    t.integer  "owner_id",                 null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.text     "content"
    t.string   "legacy_id",    limit: 255
  end

  add_index "workfile_drafts", ["owner_id"], name: "index_workfile_drafts_on_owner_id", using: :btree
  add_index "workfile_drafts", ["workfile_id", "owner_id"], name: "index_workfile_drafts_on_workfile_id_and_owner_id", unique: true, using: :btree
  add_index "workfile_drafts", ["workfile_id"], name: "index_workfile_drafts_on_workfile_id", using: :btree

  create_table "workfile_execution_locations", force: :cascade do |t|
    t.integer "workfile_id"
    t.string  "workfile_type",           limit: 255
    t.integer "execution_location_id"
    t.string  "execution_location_type", limit: 255
  end

  add_index "workfile_execution_locations", ["workfile_id"], name: "index_workfile_execution_locations_on_workfile_id", using: :btree

  create_table "workfile_versions", force: :cascade do |t|
    t.integer  "workfile_id",                       null: false
    t.integer  "version_num"
    t.integer  "owner_id",                          null: false
    t.string   "commit_message",        limit: 256
    t.integer  "modifier_id",                       null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "contents_file_name",    limit: 256
    t.string   "contents_content_type", limit: 256
    t.integer  "contents_file_size"
    t.datetime "contents_updated_at"
    t.string   "legacy_id",             limit: 255
  end

  add_index "workfile_versions", ["modifier_id"], name: "index_workfile_versions_on_modifier_id", using: :btree
  add_index "workfile_versions", ["owner_id"], name: "index_workfile_versions_on_owner_id", using: :btree
  add_index "workfile_versions", ["workfile_id"], name: "index_workfile_versions_on_workfile_id", using: :btree

  create_table "workfiles", force: :cascade do |t|
    t.integer  "workspace_id",                                                null: false
    t.integer  "owner_id",                                                    null: false
    t.text     "description"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "file_name",                  limit: 255
    t.datetime "deleted_at"
    t.integer  "latest_workfile_version_id"
    t.string   "content_type",               limit: 255
    t.integer  "execution_location_id"
    t.string   "legacy_id",                  limit: 255
    t.string   "type",                       limit: 255, default: "Workfile", null: false
    t.text     "additional_data"
    t.datetime "user_modified_at"
    t.text     "execution_location_type"
    t.string   "status",                     limit: 255, default: "idle"
  end

  add_index "workfiles", ["file_name", "workspace_id"], name: "index_workfiles_on_file_name_and_workspace_id", unique: true, using: :btree
  add_index "workfiles", ["owner_id"], name: "index_workfiles_on_owner_id", using: :btree
  add_index "workfiles", ["workspace_id"], name: "index_workfiles_on_workspace_id", using: :btree

  create_table "workspaces", force: :cascade do |t|
    t.string   "name",                      limit: 256
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.boolean  "public",                                default: false
    t.datetime "archived_at"
    t.integer  "archiver_id"
    t.text     "summary"
    t.integer  "owner_id",                                                   null: false
    t.string   "image_file_name",           limit: 256
    t.string   "image_content_type",        limit: 256
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "deleted_at"
    t.boolean  "has_added_member",                      default: false
    t.boolean  "has_added_workfile",                    default: false
    t.boolean  "has_added_sandbox",                     default: false
    t.boolean  "has_changed_settings",                  default: false
    t.integer  "sandbox_id"
    t.string   "legacy_id",                 limit: 255
    t.boolean  "show_sandbox_datasets",                 default: true
    t.boolean  "is_project",                            default: true
    t.string   "project_status",            limit: 255, default: "on_track"
    t.string   "project_status_reason",     limit: 255
    t.integer  "milestones_count",                      default: 0
    t.integer  "milestones_achieved_count",             default: 0
    t.date     "project_target_date"
    t.boolean  "archived",                              default: false
  end

  add_index "workspaces", ["archiver_id"], name: "index_workspaces_on_archiver_id", using: :btree
  add_index "workspaces", ["deleted_at", "id"], name: "index_workspaces_on_deleted_at_and_id", using: :btree
  add_index "workspaces", ["deleted_at"], name: "index_workspaces_on_deleted_at", using: :btree
  add_index "workspaces", ["id", "deleted_at"], name: "index_workspaces_on_id_and_deleted_at", using: :btree
  add_index "workspaces", ["owner_id"], name: "index_workspaces_on_owner_id", using: :btree

  add_foreign_key "application_objects", "application_classes"
  add_foreign_key "application_objects", "application_scopes"
  add_foreign_key "application_objects", "users"
  add_foreign_key "application_scopes", "groups"
  add_foreign_key "operations", "application_classes"
  add_foreign_key "permissions", "application_classes"
  add_foreign_key "permissions", "roles"
end
