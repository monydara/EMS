Rails.application.routes.draw do

  root 'home#index'

  get 'home/index'

  get 'home/login'

  #get 'employee_shift/index'

  get 'acc_key_account/index'

  get 'sdn_suspend_types/index'

  # get 'sdn_suspend_type/index'

  # get 'sdn_drop_types/index'

  get 'help/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  get "reports/qtt"
  get "security/logout_user"

  resources :security

  # Hr and Admin
  resources :employee_shift

  # hr module
  resources :hr_employees,:hr_employee_level
  resources :hr_holiday
  # account module
  resources :acc_tax_rate,:acc_batch_bill
  resources :acc_cash_drawer_groups , :acc_cash_drawers , :acc_cash_drawers_trans, :acc_discount_types, :acc_dicount_item_details, :acc_charge_items, :acc_charge_item_types, :acc_receipts, :acc_finance_trans, :acc_payment_methods, :acc_plan_masters, :acc_fee_plans , :acc_cycle_type
  resources :acc_credit_controls , :acc_invoice_rule , :acc_cash_drawer_trans , :acc_tc_fee_plan, :acc_student_account
  resources :acc_sub_accounts , :acc_invoices , :acc_batch_process
  resources :acc_fee_catalogues, :acc_fee_cat_detail_wu , :acc_fee_cat_detail_tc , :acc_group_accounts
  resources :acc_discount_items do
    member do
      get 'getDiscountItemsDetails'
    end
  end
  # generale controller
  resources :upload_file
  # system module
  resources :sys_users, :sys_roles

  # Setting module
  resources :hr_positions , :hr_department , :cfg_langauges, :cfg_ethinicities, :gen_nationalities, :gen_occupations, :cfg_class_rooms, :cfg_religions

  # System module
  resources :gen_campus , :shortcuts

  # academic module
  resources :acd_batchs , :acd_divisions , :acd_tc_level_types , :acd_subjects , :acd_subject_types , :acd_standards, :acd_degrees, :acd_course, :acd_majors, :cfg_academic_years
  resources :acd_course_levels , :acd_class_group , :course_relate
  resources :acd_degree_setup , :acd_faculty_subject_details

  resources :cfg_look_ups, :acd_terms, :acd_class_tc  , :acd_class_shift , :acd_class_wu



  # Student management Module
  resources :sdn_student_requests

  resources :gen_cities, :gen_communes, :gen_country, :gen_districts , :sdn_student_categories

  resources :sdn_lead , :sdn_document_type, :sdn_student, :sdn_drop_types, :sdn_suspend_types,:sdn_acc_key_account,:sdn_admission,:sdn_city_states

  resources :sdn_lead , :sdn_student_requests, :sdn_document_type, :sdn_student, :sdn_drop_types, :sdn_suspend_types,:sdn_acc_key_account
  resources :sdn_city_states , :tc_class_enrollment, :wu_class_enrollment
  resources :sdn_student_movement ,:sdn_status_logs


  # exam
  resources :exm_assessment_type
  resources :exm_assessment_rule
  resources :exm_tc_assessment_rule
  resources :exm_tc_grade_final
  resources :exm_grade_setup
   resources :exm_score_entry
  resources :acc_account_masters

  # Reason Type
  resources :sdn_reason_types

  get  ':controller(/:action(/:id))'
  post  ':controller(/:action(/:id))'
  
  
  

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end



end
