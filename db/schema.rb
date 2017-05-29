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

ActiveRecord::Schema.define(version: 20160609043410) do

  create_table "acc_account_details", force: true do |t|
    t.integer  "account_id"
    t.integer  "item_id"
    t.string   "item_type",      limit: 1
    t.string   "item_unit",      limit: 1
    t.decimal  "item_value",               precision: 8, scale: 2, default: 0.0
    t.boolean  "is_recurring"
    t.integer  "recurring_val",                                    default: 0
    t.date     "effective_date"
    t.date     "expired_date"
    t.text     "comments"
    t.boolean  "is_deleted",                                       default: false
    t.string   "status",         limit: 1
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_account_masters", force: true do |t|
    t.integer  "student_id"
    t.integer  "admission_id"
    t.integer  "key_account_id"
    t.integer  "group_account_id"
    t.integer  "credit_control_id"
    t.integer  "fee_plan_detail_id"
    t.string   "fee_type",           limit: 2
    t.string   "vat_no",             limit: 20
    t.integer  "cycle_type_id"
    t.string   "account_type",       limit: 1
    t.decimal  "fee_per_cycle",                 precision: 8, scale: 2, default: 0.0
    t.decimal  "balance",                       precision: 8, scale: 2, default: 0.0
    t.string   "status",             limit: 1,                          default: "A"
    t.integer  "user_id"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_batch_processes", force: true do |t|
    t.integer  "group_account_id"
    t.string   "batch_proc_code",  limit: 10
    t.string   "batch_proc_name",  limit: 100
    t.date     "proc_date"
    t.integer  "total_invoices",               default: 0
    t.string   "status",           limit: 1
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_cash_drawer_groups", force: true do |t|
    t.string   "group_name"
    t.text     "description"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.integer  "campus_id"
    t.integer  "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_cash_drawer_trans", force: true do |t|
    t.integer  "acc_cash_drawer_id"
    t.integer  "open_by"
    t.decimal  "open_amount",        precision: 12, scale: 2, default: 0.0
    t.decimal  "open_amount_khr",    precision: 12, scale: 2, default: 0.0
    t.integer  "closed_by"
    t.decimal  "closed_amount",      precision: 12, scale: 2, default: 0.0
    t.decimal  "closed_amount_khr",  precision: 12, scale: 2, default: 0.0
    t.date     "open_date"
    t.date     "closed_date"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_cash_drawers", force: true do |t|
    t.integer  "cdg_id"
    t.integer  "sys_user_id"
    t.boolean  "is_active"
    t.boolean  "is_deleted"
    t.integer  "create_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_ccy_rate_histories", force: true do |t|
    t.integer  "ccy_id"
    t.decimal  "old_rate",   precision: 8, scale: 2, default: 0.0
    t.decimal  "new_rate",   precision: 8, scale: 2, default: 0.0
    t.integer  "user_id"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_charge_item_types", force: true do |t|
    t.string   "item_type_code", limit: 6,                  null: false
    t.string   "item_type_name", limit: 50,                 null: false
    t.text     "note"
    t.boolean  "is_del",                    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_charge_items", force: true do |t|
    t.string   "item_code",     limit: 6
    t.string   "item_name",     limit: 50
    t.integer  "item_type_id"
    t.decimal  "charge_amount",            precision: 8, scale: 2, default: 0.0
    t.boolean  "is_editable",                                      default: false
    t.text     "note"
    t.string   "status",        limit: 1,                          default: "A"
    t.integer  "campus_id"
    t.boolean  "is_del",                                           default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_credit_controls", force: true do |t|
    t.string   "policy_name", limit: 50
    t.integer  "due_days"
    t.text     "description"
    t.boolean  "is_active",              default: false
    t.boolean  "is_del",                 default: false
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_currencies", force: true do |t|
    t.string   "ccy_code",   limit: 3,                                        null: false
    t.string   "ccy_name",   limit: 50
    t.decimal  "ccy_rate",              precision: 8, scale: 2, default: 0.0
    t.string   "status",     limit: 1,                          default: "O"
    t.integer  "campus_id"
    t.integer  "maker_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_cycle_types", force: true do |t|
    t.string   "cycle_code",      limit: 6,              null: false
    t.string   "cycle_name",      limit: 50
    t.integer  "cycle_value",                default: 0
    t.integer  "cycle_per_class",            default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_discount_courses", force: true do |t|
    t.integer  "discount_item_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_discount_item_details", force: true do |t|
    t.integer  "acc_discount_item_id"
    t.boolean  "is_allow_edit",                                           default: false
    t.text     "note"
    t.boolean  "is_del",                                                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "discount_unit",        limit: 1
    t.decimal  "discount_value",                 precision: 10, scale: 0
  end

  create_table "acc_discount_items", force: true do |t|
    t.string   "item_code",        limit: 6
    t.string   "item_name",        limit: 50
    t.boolean  "is_all_courses",               default: false
    t.integer  "discount_type_id"
    t.date     "effective_date"
    t.date     "expired_date"
    t.string   "Autherizer",       limit: 100
    t.string   "reference_no",     limit: 50
    t.text     "note"
    t.boolean  "is_del"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_discount_types", force: true do |t|
    t.string   "code",       limit: 6
    t.string   "name",       limit: 50
    t.boolean  "is_del",                default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_fee_cat_detail_wus", force: true do |t|
    t.integer  "plan_cat_id"
    t.integer  "plan_id"
    t.integer  "plan_num"
    t.integer  "batch_id"
    t.integer  "cycle_type_id"
    t.integer  "currency_id"
    t.decimal  "fee_amount",              precision: 16, scale: 4
    t.integer  "is_active",     limit: 1
    t.integer  "is_deleted",    limit: 1
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_fee_catalogues", force: true do |t|
    t.string   "catalogue_name"
    t.string   "fiscal_year",    limit: 45
    t.date     "effective_date"
    t.date     "expired_date"
    t.text     "description"
    t.integer  "is_active",      limit: 1
    t.integer  "is_deleted",     limit: 1
    t.integer  "user_id"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_fee_plan_details", force: true do |t|
    t.integer  "plan_id"
    t.integer  "plan_num"
    t.text     "description"
    t.integer  "cycle_type_id"
    t.integer  "term_id"
    t.integer  "currency_id"
    t.decimal  "fee_amount",              precision: 16, scale: 4
    t.integer  "is_active",     limit: 1
    t.integer  "is_deleted",    limit: 1
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_fee_plans", force: true do |t|
    t.integer  "plan_cat_id"
    t.integer  "batch_id"
    t.integer  "tuition_time_id"
    t.string   "plan_code",       limit: 6
    t.string   "plan_name",       limit: 50
    t.integer  "degree_id"
    t.integer  "course_id"
    t.text     "description"
    t.boolean  "is_active"
    t.boolean  "is_delleted"
    t.string   "plan_type",       limit: 2
    t.integer  "user_id"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_finance_trans", force: true do |t|
    t.integer  "account_id"
    t.string   "receipt_no",              limit: 6
    t.integer  "acc_tran_type_id"
    t.integer  "acc_reason_type_id"
    t.integer  "acc_cash_drawer_tran_id"
    t.integer  "acc_payment_method_id"
    t.string   "ref_no",                  limit: 30
    t.date     "tran_date"
    t.string   "currency_code",           limit: 3
    t.decimal  "amount_usd",                         precision: 10, scale: 4, default: 0.0, null: false
    t.decimal  "amount_khr",                         precision: 10, scale: 4, default: 0.0
    t.date     "commited_date"
    t.date     "rollback_date"
    t.text     "remark"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "acc_group_accounts", force: true do |t|
    t.string   "group_code",      limit: 10
    t.string   "group_name",      limit: 100
    t.string   "group_type",      limit: 2,   default: "TC"
    t.string   "account_type",    limit: 1
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "total_invoices"
    t.integer  "remain_invoices"
    t.string   "status",          limit: 2,   default: "O"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_invoice_details", force: true do |t|
    t.integer  "invoice_id"
    t.string   "item_type",   limit: 2,                          default: "F"
    t.integer  "item_id"
    t.decimal  "amount",                precision: 12, scale: 2, default: 0.0
    t.text     "description"
    t.boolean  "is_deleted",                                     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_invoice_rules", force: true do |t|
    t.string   "rule_name",         limit: 50
    t.integer  "from_days",                                            default: 0
    t.integer  "to_days",                                              default: 0
    t.integer  "credit_control_id"
    t.integer  "alert_type_id"
    t.integer  "action_type_id"
    t.decimal  "charge_per_day",               precision: 8, scale: 2, default: 0.0
    t.text     "description"
    t.boolean  "is_active",                                            default: true
    t.boolean  "is_del",                                               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_invoice_settle", force: true do |t|
    t.integer  "invoice_id"
    t.integer  "tran_id"
    t.decimal  "settle_amount", precision: 10, scale: 4
    t.date     "settle_date"
    t.integer  "settle_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_invoices", force: true do |t|
    t.integer  "account_id"
    t.string   "invoice_no",         limit: 10
    t.string   "invoice_type",       limit: 2,                           default: "TC"
    t.integer  "degree_id"
    t.integer  "course_id"
    t.integer  "batch_id"
    t.integer  "standard_id"
    t.integer  "division_id"
    t.integer  "course_level_id"
    t.integer  "term_id"
    t.integer  "cycle_type_id"
    t.string   "vat_number",         limit: 20
    t.date     "issue_date"
    t.date     "due_date"
    t.date     "from_date"
    t.date     "to_date"
    t.decimal  "total_amount",                  precision: 22, scale: 2
    t.boolean  "is_paid"
    t.integer  "billing_process_id"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_payment_methods", force: true do |t|
    t.string   "code",        limit: 6
    t.string   "name",        limit: 50
    t.string   "method_type", limit: 1
    t.boolean  "is_del",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_plan_masters", force: true do |t|
    t.string   "plan_master_name", limit: 50,                                          null: false
    t.integer  "fiscal_year",                                                          null: false
    t.date     "effective_date"
    t.date     "expired_date"
    t.decimal  "khr_rate",                    precision: 10, scale: 4
    t.text     "description"
    t.boolean  "is_tc",                                                default: false
    t.integer  "campus_id"
    t.boolean  "is_active"
    t.boolean  "is_del"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "acd_batche_id"
  end

  create_table "acc_pre_payments", force: true do |t|
    t.integer  "lead_id"
    t.integer  "fin_tran_id"
    t.date     "trn_date"
    t.string   "currency",    limit: 3,                          default: "USD"
    t.decimal  "trn_amount",            precision: 18, scale: 4, default: 0.0
    t.decimal  "ex_rate",               precision: 8,  scale: 4, default: 0.0
    t.decimal  "lcy_amount",            precision: 18, scale: 4, default: 0.0
    t.text     "remark"
    t.string   "status",      limit: 1,                          default: "B"
    t.integer  "maker_id"
    t.integer  "checker_id"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_receipt_details", force: true do |t|
    t.integer  "receipt_id"
    t.string   "item_type",   limit: 1,                            default: "C", null: false
    t.integer  "item_id"
    t.decimal  "amount",                  precision: 16, scale: 4
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "item_name",   limit: 100
    t.string   "item_unit",   limit: 1,                            default: "A"
  end

  create_table "acc_receipts", force: true do |t|
    t.date     "receipt_date"
    t.string   "receipt_no",      limit: 6
    t.string   "receipt_type",    limit: 3,                            default: "OTR"
    t.string   "ref_type",        limit: 1,                            default: "O"
    t.string   "payer_name",      limit: 100
    t.integer  "ref_id",                                               default: 0
    t.decimal  "usd_amount",                  precision: 10, scale: 4, default: 0.0
    t.decimal  "khr_amount",                  precision: 10, scale: 4, default: 0.0
    t.decimal  "charges_amount",              precision: 10, scale: 2
    t.decimal  "discount_amount",             precision: 10, scale: 2
    t.text     "remark"
    t.boolean  "is_paid",                                              default: false
    t.datetime "paid_date"
    t.boolean  "is_del",                                               default: false
    t.integer  "receipt_by_id"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_receipts_settlements", force: true do |t|
    t.integer  "acc_receipt_id"
    t.integer  "acc_finance_tran_id"
    t.decimal  "settl_amount",        precision: 10, scale: 0
    t.date     "settl_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_student_accounts", force: true do |t|
    t.string   "account_no",        limit: 8
    t.integer  "lead_id"
    t.integer  "student_id"
    t.integer  "key_account_id"
    t.integer  "credit_control_id"
    t.string   "account_type",      limit: 1,                           default: "N"
    t.string   "vat_number",        limit: 20
    t.decimal  "deposit_amount",               precision: 8,  scale: 2, default: 0.0
    t.decimal  "balance",                      precision: 12, scale: 2, default: 0.0
    t.date     "start_date"
    t.date     "end_date"
    t.text     "remark"
    t.string   "status",            limit: 1,                           default: "N"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_sub_accounts", force: true do |t|
    t.integer  "student_account_id"
    t.integer  "tuition_time",                                         default: 1
    t.integer  "cycle_type_id"
    t.integer  "term_id"
    t.decimal  "cycle_fee",                    precision: 8, scale: 2, default: 0.0
    t.string   "plan_type",          limit: 2,                         default: "TC"
    t.integer  "plan_id"
    t.integer  "batch_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "status",             limit: 1,                         default: "A"
    t.boolean  "is_deleted",                                           default: false
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_tax_rates", force: true do |t|
    t.string   "code",        limit: 6
    t.text     "description"
    t.integer  "tax_type_id"
    t.decimal  "tax_rate",              precision: 6, scale: 2, default: 0.0
    t.boolean  "is_active",                                     default: true
    t.boolean  "is_deleted",                                    default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_tax_types", force: true do |t|
    t.string   "code",        limit: 6
    t.string   "name",        limit: 50
    t.text     "description"
    t.boolean  "is_deleted",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_tc_fee_plans", force: true do |t|
    t.integer  "acc_plan_master_id"
    t.string   "plan_code",          limit: 6
    t.string   "plan_name",          limit: 100
    t.boolean  "is_full_time",                                            default: true
    t.integer  "degree_id"
    t.integer  "course_id"
    t.decimal  "term_one_fee",                   precision: 12, scale: 2, default: 0.0
    t.decimal  "term_two_fee",                   precision: 12, scale: 2, default: 0.0
    t.decimal  "term_three_fee",                 precision: 12, scale: 2, default: 0.0
    t.decimal  "term_four_fee",                  precision: 12, scale: 2, default: 0.0
    t.boolean  "is_active",                                               default: true
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_tc_level_plans", force: true do |t|
    t.integer  "acc_level_id"
    t.integer  "tc_fee_plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acc_tran_types", force: true do |t|
    t.string   "code",           limit: 6
    t.string   "tran_type_desc", limit: 50
    t.boolean  "is_negative",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_batch_courses", force: true do |t|
    t.integer  "batch_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_batches", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "gen_campus_id"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "khr_name"
  end

  create_table "acd_class_divisions", force: true do |t|
    t.string   "code",       limit: 6
    t.string   "name",       limit: 50
    t.integer  "sequence"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "khr_name"
  end

  create_table "acd_class_groups", force: true do |t|
    t.string   "code",       limit: 6
    t.string   "name",       limit: 100
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_class_rooms", force: true do |t|
    t.string   "code",        limit: 6
    t.string   "name",        limit: 50
    t.string   "description"
    t.integer  "max_seat"
    t.integer  "campus_id"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "khr_name"
  end

  create_table "acd_class_sessions", force: true do |t|
    t.string   "code",       limit: 6
    t.string   "name",       limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_class_shifts", force: true do |t|
    t.string   "code",       limit: 6
    t.string   "name",       limit: 50
    t.string   "khr_name",   limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_class_tc_details", force: true do |t|
    t.integer  "class_tc_id"
    t.integer  "subject_id"
    t.integer  "lecture_id"
    t.integer  "total_session"
    t.integer  "pass_score"
    t.integer  "max_score"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_class_tcs", force: true do |t|
    t.string   "class_code",       limit: 15
    t.string   "class_name",       limit: 100
    t.integer  "degree_id"
    t.integer  "course_id"
    t.integer  "academic_year_id"
    t.integer  "term_id"
    t.integer  "room_id"
    t.integer  "course_level_id"
    t.integer  "tuition_time_id"
    t.integer  "session_id"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "study_start_time"
    t.text     "description"
    t.string   "status",           limit: 1
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_class_wu_details", force: true do |t|
    t.integer  "class_wu_id"
    t.integer  "subject_id"
    t.integer  "lecturer_id"
    t.integer  "division_id"
    t.integer  "total_session"
    t.integer  "credit"
    t.integer  "pass_score"
    t.integer  "max_score"
    t.boolean  "no_exam"
    t.boolean  "is_exam"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_class_wus", force: true do |t|
    t.string   "class_code",       limit: 15
    t.string   "class_name",       limit: 100
    t.string   "program_type",     limit: 1
    t.integer  "degree_id"
    t.integer  "course_id"
    t.integer  "standard_id"
    t.integer  "division_id"
    t.integer  "academic_year_id"
    t.integer  "room_id"
    t.integer  "class_shift_id"
    t.boolean  "is_gpa"
    t.integer  "credit"
    t.date     "start_date"
    t.date     "end_date"
    t.text     "description"
    t.string   "status",           limit: 1
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_course_books", force: true do |t|
    t.string   "book_code",   limit: 6,                  null: false
    t.string   "book_name",   limit: 50,                 null: false
    t.string   "author",      limit: 50
    t.text     "description"
    t.string   "status",      limit: 1,  default: "A"
    t.boolean  "is_deleted",             default: false
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_course_faculties", force: true do |t|
    t.string   "code",        limit: 6
    t.string   "abbr",        limit: 3
    t.string   "name",        limit: 50
    t.string   "course_type", limit: 2
    t.integer  "credit"
    t.string   "status",      limit: 1,  default: "A"
    t.text     "description"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "campus_id"
    t.string   "khr_name"
  end

  create_table "acd_course_level_types", force: true do |t|
    t.string   "code",       limit: 6
    t.string   "name",       limit: 50
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_course_levels", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "course_id"
    t.integer  "level_type_id"
    t.integer  "sequence",      default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_course_majors", force: true do |t|
    t.integer  "major_id"
    t.integer  "course_id"
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_course_subjects", force: true do |t|
    t.integer  "acd_course_id"
    t.integer  "acd_subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "degree_course_id"
  end

  create_table "acd_degree_courses", force: true do |t|
    t.integer  "degree_id"
    t.integer  "course_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_degrees", force: true do |t|
    t.string   "name"
    t.string   "abbr"
    t.string   "degree_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_faculty_divisions", force: true do |t|
    t.integer "division_id"
    t.integer "standard_id"
    t.integer "course_id"
    t.integer "degree_id"
  end

  create_table "acd_faculty_standards", force: true do |t|
    t.integer "standard_id"
    t.integer "course_id"
    t.integer "degree_id"
  end

  create_table "acd_faculty_subject_details", force: true do |t|
    t.integer  "division_id"
    t.integer  "standard_id"
    t.integer  "course_id"
    t.integer  "degree_id"
    t.integer  "subject_id"
    t.integer  "total_credits",                   default: 0
    t.integer  "sessions_per_week",               default: 0
    t.integer  "total_sessions",                  default: 0
    t.integer  "durations_per_session",           default: 0
    t.integer  "total_durations",                 default: 0
    t.text     "description"
    t.integer  "is_deleted",            limit: 1, default: 0
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_majors", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "khr_name"
    t.integer  "campus_id"
  end

  create_table "acd_rel_courses_subjects", force: true do |t|
    t.integer  "course_id"
    t.integer  "subject_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_room_items", force: true do |t|
    t.integer  "room_id"
    t.integer  "item_id"
    t.integer  "qty",         default: 0
    t.string   "stock_type",  default: "I"
    t.integer  "stock_by_id"
    t.boolean  "is_deleted",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_standard_divisions", force: true do |t|
    t.integer  "standard_id"
    t.integer  "division_id"
    t.integer  "stand_degree_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_standards", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "sequence"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "khr_name"
  end

  create_table "acd_subject_types", force: true do |t|
    t.string   "name"
    t.string   "khr_name",   limit: 50
    t.string   "code",       limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_subjects", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subject_type_id"
    t.integer  "campus_id"
    t.boolean  "is_deleted"
    t.string   "khr_name"
    t.integer  "credit"
    t.integer  "sessions"
  end

  create_table "acd_terms", force: true do |t|
    t.string   "code",       limit: 6
    t.string   "term_name"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_tm_courses", force: true do |t|
    t.string   "code",        limit: 6,                   null: false
    t.string   "name",        limit: 100,                 null: false
    t.string   "khr_name",    limit: 100
    t.string   "abbr",        limit: 3,                   null: false
    t.integer  "degree_id"
    t.text     "description"
    t.string   "status",      limit: 1,   default: "A"
    t.boolean  "is_deleted",              default: false
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "acd_tuition_times", force: true do |t|
    t.string   "tuition_name"
    t.integer  "tuition_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auditrials", force: true do |t|
    t.integer  "user_id"
    t.string   "ad_type"
    t.string   "module"
    t.text     "description"
    t.text     "data_detail"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "table_name"
    t.integer  "reference_id"
  end

  create_table "audits", force: true do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "cfg_academic_years", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "gen_campus_id"
    t.integer  "user_id"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cfg_ethinicities", force: true do |t|
    t.string   "name"
    t.string   "khr"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cfg_langauges", force: true do |t|
    t.string   "name"
    t.string   "khr"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cfg_look_ups", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "k_name"
    t.string   "l_type"
    t.integer  "int_val"
    t.integer  "line_seq"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cfg_message_templates", force: true do |t|
    t.string   "name"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cfg_religions", force: true do |t|
    t.string   "name"
    t.string   "khr"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "degree_standards", force: true do |t|
    t.integer  "degree_id"
    t.integer  "standard_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exm_assessment_rule_details", force: true do |t|
    t.integer  "assessment_rule_id"
    t.integer  "assessment_type_id"
    t.integer  "rate_p"
    t.decimal  "rate_value",         precision: 10, scale: 0
    t.boolean  "is_deleted",                                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exm_assessment_rules", force: true do |t|
    t.string   "rule_code",  limit: 6
    t.string   "rule_name",  limit: 50
    t.string   "status",     limit: 1
    t.integer  "campus_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exm_examinations", force: true do |t|
    t.string   "code",        limit: 6
    t.string   "name",        limit: 50
    t.text     "description"
    t.string   "exam_type",   limit: 1,  default: "E"
    t.integer  "exam_level",             default: 1
    t.boolean  "is_deleted",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exm_gpas", force: true do |t|
    t.string   "name",        limit: 50
    t.integer  "exam_id"
    t.string   "edu_type",    limit: 2,                          default: "TC"
    t.text     "description"
    t.decimal  "gpa_value",              precision: 4, scale: 2, default: 0.0
    t.integer  "is_deleted",                                     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exm_tc_assessment_setup_details", force: true do |t|
    t.integer  "assessment_setup_id"
    t.integer  "assessment_type_id"
    t.integer  "rate_p"
    t.float    "rate_value",          limit: 24
    t.boolean  "is_deleted",                     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exm_tc_assessment_setups", force: true do |t|
    t.string   "name",        limit: 50
    t.integer  "total_rate"
    t.boolean  "status",                 default: false
    t.boolean  "is_deleted",             default: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exm_tc_assessment_types", force: true do |t|
    t.string   "code",           limit: 6
    t.string   "name",           limit: 50
    t.text     "description"
    t.string   "category",                  default: "A"
    t.integer  "max_assessment"
    t.boolean  "is_tc",                     default: false
    t.boolean  "is_deleted",                default: false
    t.string   "status",                    default: "A"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exm_tc_attendance_details", force: true do |t|
    t.integer  "attendance_id"
    t.integer  "student_id"
    t.string   "status",        limit: 1, default: "P"
    t.boolean  "is_deleted",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exm_tc_attendances", force: true do |t|
    t.integer  "class_id"
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.date     "record_date"
    t.string   "start_time",   limit: 15
    t.boolean  "is_generated",            default: false
    t.boolean  "is_deleted",              default: false
    t.integer  "user_id"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exm_tc_grade_finals", force: true do |t|
    t.float    "max_avg",     limit: 24
    t.string   "grade_type",  limit: 5
    t.boolean  "is_deleted",             default: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exm_tc_score_details", force: true do |t|
    t.integer  "score_master_id"
    t.integer  "student_id"
    t.integer  "score"
    t.boolean  "is_deleted",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exm_tc_score_masters", force: true do |t|
    t.integer  "class_id"
    t.integer  "teacher_id"
    t.integer  "subject_id"
    t.integer  "assessment_type_id"
    t.date     "score_date"
    t.boolean  "is_generated",       default: false
    t.boolean  "is_deleted",         default: false
    t.integer  "user_id"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "file_uploads", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "gen_campus", force: true do |t|
    t.string   "campus_code"
    t.string   "campus_name"
    t.string   "abbr"
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.string   "director"
    t.datetime "start_date"
    t.boolean  "is_deleted"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gen_cities", force: true do |t|
    t.integer  "gen_country_id"
    t.string   "city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gen_communes", force: true do |t|
    t.integer  "gen_district_id"
    t.integer  "gen_city_id"
    t.string   "commune"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gen_countries", force: true do |t|
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gen_districts", force: true do |t|
    t.integer  "gen_city_id"
    t.string   "district"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gen_nationalities", force: true do |t|
    t.string   "name"
    t.string   "khr"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "gen_occupations", force: true do |t|
    t.string   "name"
    t.string   "khr"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hr_departments", force: true do |t|
    t.string   "department"
    t.text     "description"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hr_employee_levels", force: true do |t|
    t.string   "emp_level",     limit: 50
    t.string   "khr_emp_level", limit: 50
    t.text     "description"
    t.integer  "level_value",              default: 0
    t.boolean  "is_deleted",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hr_employee_shifts", force: true do |t|
    t.string   "shift_name",  limit: 50
    t.string   "shift_type",  limit: 2,   default: "FT"
    t.string   "start_time",  limit: 10
    t.string   "end_time",    limit: 10
    t.string   "description", limit: 250
    t.integer  "campus_id"
    t.boolean  "is_deleted",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hr_employees", force: true do |t|
    t.string   "code",           limit: 6
    t.integer  "title_id"
    t.string   "name",           limit: 100
    t.string   "khr_name",       limit: 100
    t.string   "gender",         limit: 1
    t.date     "hire_date"
    t.date     "birth_date"
    t.string   "place_of_birth", limit: 200
    t.string   "emp_type",       limit: 1
    t.string   "working_time",   limit: 2,                            default: "FT"
    t.integer  "emp_level_id"
    t.integer  "position_id"
    t.integer  "department_id"
    t.integer  "shift_id"
    t.string   "height",         limit: 10
    t.string   "size",           limit: 10
    t.decimal  "basic_salary",               precision: 10, scale: 0
    t.string   "id_card_no",     limit: 30
    t.string   "passport_no",    limit: 30
    t.integer  "national_id"
    t.integer  "ethnicity_id"
    t.integer  "religion_id"
    t.integer  "langauge_id"
    t.string   "marital_status", limit: 1
    t.string   "spouse_name",    limit: 100
    t.integer  "no_of_child"
    t.integer  "studied_child"
    t.string   "house_no",       limit: 20
    t.string   "street_no",      limit: 50
    t.string   "group_no",       limit: 20
    t.string   "village",        limit: 50
    t.string   "country",        limit: 50
    t.string   "city",           limit: 50
    t.string   "district",       limit: 50
    t.string   "commune",        limit: 50
    t.string   "phone_no",       limit: 30
    t.string   "email",          limit: 50
    t.text     "description"
    t.string   "status",         limit: 2
    t.text     "photo_path"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hr_holidays", force: true do |t|
    t.string   "code",             limit: 6,                  null: false
    t.string   "name",             limit: 50,                 null: false
    t.string   "khr_name",         limit: 50,                 null: false
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "academic_year_id"
    t.text     "description"
    t.boolean  "is_deleted",                  default: false
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hr_positions", force: true do |t|
    t.string   "position"
    t.text     "description"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", force: true do |t|
    t.datetime "image_updated_at"
    t.integer  "image_file_size"
    t.string   "image_content_type"
    t.string   "image_file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inv_items", force: true do |t|
    t.string   "item_code",   limit: 6,  null: false
    t.string   "item_name",   limit: 50, null: false
    t.text     "description"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "next_versions", force: true do |t|
    t.string   "n_type"
    t.string   "description"
    t.integer  "next_code"
    t.integer  "degit"
    t.string   "prefix"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_acc_key_accounts", force: true do |t|
    t.string   "code",       limit: 6
    t.string   "name",       limit: 100
    t.string   "refer_type", limit: 1,   default: "O"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_deleted",             default: false
  end

  create_table "sdn_additional_fees", force: true do |t|
    t.integer  "fee_charge_id"
    t.integer  "item_charge_id"
    t.decimal  "charge_amount",  precision: 8, scale: 2, default: 0.0
    t.boolean  "is_recurring",                           default: false
    t.boolean  "is_bill",                                default: false
    t.text     "note"
    t.boolean  "is_del",                                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_admission_histories", force: true do |t|
    t.integer  "student_id"
    t.integer  "admission_id"
    t.string   "program_type",         limit: 1, default: "N"
    t.integer  "batch_id"
    t.integer  "degree_id"
    t.integer  "course_id"
    t.integer  "class_shift_id"
    t.integer  "major_id"
    t.integer  "start_acad_year_id"
    t.integer  "current_acad_year_id"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_admissions", force: true do |t|
    t.integer  "student_id"
    t.integer  "lead_id"
    t.string   "admission_no",      limit: 30
    t.date     "admission_date"
    t.integer  "admission_by_id"
    t.string   "admission_type",    limit: 1,  default: "N"
    t.string   "program_type",      limit: 1,  default: "N", null: false
    t.integer  "tuition_time_id"
    t.integer  "term_id"
    t.integer  "s_level_id"
    t.integer  "c_level_id"
    t.integer  "batch_id"
    t.integer  "degree_id"
    t.integer  "course_id"
    t.integer  "class_shift_id"
    t.integer  "major_id"
    t.integer  "start_acd_year_id"
    t.integer  "end_acd_year_id"
    t.integer  "class_id"
    t.text     "note"
    t.string   "status",            limit: 1,  default: "N", null: false
    t.string   "record_stat",       limit: 1,  default: "O"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "reference_no",      limit: 20
  end

  create_table "sdn_categories", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.boolean  "is_deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_change_histories", force: true do |t|
    t.integer  "student_id"
    t.integer  "admission_id"
    t.string   "change_type",   limit: 1, default: "F"
    t.integer  "from_ref_id"
    t.integer  "to_ref_id"
    t.date     "changed_date"
    t.integer  "changed_by_id"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_city_states", force: true do |t|
    t.string   "city_code",     limit: 6,                  null: false
    t.string   "city_name",     limit: 50,                 null: false
    t.string   "city_name_khr", limit: 50,                 null: false
    t.text     "description"
    t.boolean  "is_deleted",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_class_students", force: true do |t|
    t.integer  "class_id"
    t.integer  "student_id"
    t.integer  "admission_id"
    t.string   "degree_type",  limit: 2, default: "WU"
    t.date     "enroll_date"
    t.integer  "enroll_by_id"
    t.integer  "is_promoted",  limit: 1, default: 0
    t.integer  "campus_id"
    t.boolean  "is_del",                 default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_class_tc_students", force: true do |t|
    t.integer  "class_id"
    t.integer  "student_id"
    t.integer  "admission_id"
    t.date     "enroll_date"
    t.integer  "enroll_by_id"
    t.boolean  "is_promoted",  default: false
    t.integer  "campus_id"
    t.boolean  "is_del",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_contacts", force: true do |t|
    t.integer  "student_id"
    t.integer  "title_id"
    t.string   "contact_type", limit: 2,   default: ""
    t.string   "contact_name", limit: 100
    t.string   "gender",       limit: 1,   default: "M"
    t.text     "address"
    t.string   "email",        limit: 100, default: ""
    t.string   "phone",        limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_document_types", force: true do |t|
    t.string   "code",       limit: 6
    t.string   "type_name",  limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_documents", force: true do |t|
    t.string   "doc_name",            limit: 50
    t.integer  "doc_type_id"
    t.integer  "student_id"
    t.text     "file_path"
    t.string   "orginal_file_name",   limit: 100
    t.boolean  "is_del",                          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "tmp_emp_id"
  end

  create_table "sdn_drop_types", force: true do |t|
    t.string   "code",        limit: 6
    t.string   "name",        limit: 50
    t.string   "description", limit: 250
    t.boolean  "is_deleted",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_fee_charges", force: true do |t|
    t.integer  "student_id"
    t.integer  "admission_id"
    t.integer  "key_account_id"
    t.integer  "plan_id"
    t.integer  "cycle_type_id"
    t.integer  "credit_control_id"
    t.string   "pay_type",           limit: 1
    t.boolean  "is_vat",                                                default: false
    t.string   "vat_number",         limit: 30
    t.string   "deposit_receipt_no", limit: 6
    t.decimal  "deposit_fee",                   precision: 8, scale: 2, default: 0.0
    t.decimal  "total_fee",                     precision: 8, scale: 2, default: 0.0
    t.decimal  "fee_paid",                      precision: 8, scale: 2, default: 0.0
    t.decimal  "credit_balance",                precision: 8, scale: 2, default: 0.0
    t.decimal  "cycle_fee",                     precision: 8, scale: 2, default: 0.0
    t.decimal  "net_cycle_fee",                 precision: 8, scale: 2, default: 0.0
    t.text     "note"
    t.boolean  "is_acitve",                                             default: true
    t.date     "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_fee_discounts", force: true do |t|
    t.integer  "fee_charge_id"
    t.integer  "discount_item_detail_id"
    t.decimal  "discount_amount",                    precision: 8, scale: 2, default: 0.0
    t.float    "discount_p",              limit: 24,                         default: 0.0
    t.string   "deduct_type",             limit: 1,                          default: "F"
    t.boolean  "is_bill",                                                    default: false
    t.integer  "discount_by_id"
    t.text     "note"
    t.boolean  "is_del",                                                     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_leads", force: true do |t|
    t.integer  "title_id"
    t.string   "first_name",          limit: 50, default: "",  null: false
    t.string   "last_name",           limit: 50, default: "",  null: false
    t.string   "khr_first_name",      limit: 50, default: "",  null: false
    t.string   "khr_last_name",       limit: 50, default: "",  null: false
    t.string   "gender",              limit: 1,  default: "M", null: false
    t.date     "date_of_birth"
    t.date     "registered_date"
    t.string   "place_of_birth",                 default: "",  null: false
    t.string   "phone_no",            limit: 35, default: "",  null: false
    t.string   "email",                          default: "",  null: false
    t.string   "address",                        default: "",  null: false
    t.text     "note"
    t.text     "image_url"
    t.integer  "degree_id"
    t.integer  "course_id"
    t.integer  "class_shift_id"
    t.boolean  "is_canceled"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "sdn_reason_types", force: true do |t|
    t.string   "code",        limit: 6
    t.string   "type_name",   limit: 100
    t.text     "description"
    t.string   "reason_for",  limit: 1,   default: "D"
    t.boolean  "is_deleted",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_status_logs", force: true do |t|
    t.integer  "student_id"
    t.integer  "admission_id"
    t.string   "status_type",    limit: 1, default: "N"
    t.integer  "reason_type_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "status_by_id"
    t.text     "description"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_student_khrs", force: true do |t|
    t.integer  "student_id"
    t.string   "gender",            limit: 10
    t.string   "date_of_birth",     limit: 20
    t.text     "place_of_birth"
    t.text     "address"
    t.string   "phone",             limit: 30
    t.string   "diploma_year",      limit: 50
    t.string   "diploma_grade",     limit: 1
    t.integer  "total_score",                   default: 0
    t.boolean  "is_passed_diploma"
    t.string   "diploma_num",       limit: 50
    t.string   "certificate",       limit: 100
    t.string   "institue",          limit: 100
    t.string   "institue_city",     limit: 100
    t.string   "city",              limit: 100
    t.string   "father_name",       limit: 100
    t.string   "mother_name",       limit: 100
    t.string   "occupation",        limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_student_promotes", force: true do |t|
    t.integer  "admission_id"
    t.string   "class_type",     limit: 2, default: "TC"
    t.integer  "from_class_id"
    t.integer  "to_class_id"
    t.integer  "promoted_by_id"
    t.integer  "campus_id"
    t.date     "promoted_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_student_requests", force: true do |t|
    t.string   "request_no",   limit: 8
    t.date     "request_date"
    t.integer  "student_id"
    t.text     "note"
    t.integer  "marker_id"
    t.date     "maker_date"
    t.integer  "checker_id"
    t.date     "checker_date"
    t.string   "status",       limit: 1, default: "N"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sdn_students", force: true do |t|
    t.integer  "lead_id"
    t.integer  "category_id"
    t.integer  "title_id"
    t.string   "student_code",    limit: 50
    t.string   "student_no",      limit: 13
    t.string   "first_name",      limit: 50,                null: false
    t.string   "last_name",       limit: 50,                null: false
    t.string   "khr_first_name",  limit: 50
    t.string   "khr_last_name",   limit: 50
    t.string   "gender",          limit: 1,   default: "M", null: false
    t.date     "date_of_birth"
    t.date     "registered_date"
    t.text     "place_of_birth"
    t.string   "phone_no",        limit: 30
    t.string   "email",           limit: 100
    t.text     "address"
    t.integer  "from_city_id"
    t.integer  "occupation_id"
    t.integer  "national_id"
    t.integer  "religion_id"
    t.integer  "langauge_id"
    t.integer  "ethnicity_id"
    t.string   "national_no",     limit: 30
    t.string   "passport_no",     limit: 30
    t.text     "note"
    t.string   "image_url"
    t.string   "handler",         limit: 2
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",          limit: 1
    t.string   "record_stat",     limit: 1,   default: "O"
  end

  create_table "sdn_suspend_types", force: true do |t|
    t.string   "code",        limit: 6
    t.string   "name",        limit: 50
    t.string   "description", limit: 250
    t.boolean  "is_deleted",              default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sys_menus", force: true do |t|
    t.string   "name",        limit: 50
    t.string   "description", limit: 50
    t.string   "module",      limit: 50
    t.string   "group",       limit: 50
    t.string   "url"
    t.string   "action",      limit: 50
    t.integer  "order_val"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shortcut_id"
  end

  create_table "sys_role_shortcuts", force: true do |t|
    t.integer  "shortcut_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sys_role_users", force: true do |t|
    t.integer  "role_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sys_roles", force: true do |t|
    t.string   "code",        limit: 6
    t.string   "name",        limit: 50
    t.text     "description"
    t.boolean  "is_deleted",             default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sys_shortcut_menus", force: true do |t|
    t.integer  "shortcut_id"
    t.integer  "role_id"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sys_shortcuts", force: true do |t|
    t.string   "name",       limit: 50
    t.string   "iconCls",    limit: 50
    t.string   "module",     limit: 50
    t.string   "modules",    limit: 50
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sys_user_campus", force: true do |t|
    t.integer  "sys_user_id"
    t.integer  "gen_campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sys_user_degrees", force: true do |t|
    t.integer  "user_id"
    t.integer  "degree_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sys_user_locations", force: true do |t|
    t.integer  "user_id"
    t.integer  "campus_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sys_user_shortcuts", force: true do |t|
    t.integer  "user_id"
    t.integer  "shortcut_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sys_users", force: true do |t|
    t.string   "user_id"
    t.string   "user_name"
    t.string   "encrypted_password"
    t.integer  "hr_position_id"
    t.integer  "hr_department_id"
    t.string   "address"
    t.string   "phone"
    t.string   "email"
    t.text     "description"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type",          limit: 10, default: "Staff"
    t.date     "start_date"
    t.integer  "home_campus_id"
  end

  create_table "vw_account_detail", id: false, force: true do |t|
    t.text     "item_name",      limit: 16777215
    t.integer  "id",                                                      default: 0,     null: false
    t.integer  "account_id"
    t.integer  "item_id"
    t.string   "item_type",      limit: 1
    t.string   "item_unit",      limit: 1
    t.decimal  "item_value",                      precision: 8, scale: 2, default: 0.0
    t.boolean  "is_recurring"
    t.integer  "recurring_val",                                           default: 0
    t.date     "effective_date"
    t.date     "expired_date"
    t.text     "comments"
    t.boolean  "is_deleted",                                              default: false
    t.string   "status",         limit: 1
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
