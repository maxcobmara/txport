Txport::Application.routes.draw do
  resources :maintenance_types

  resources :acquired_types

  resources :expertises

  resources :positions

  resources :inden_usages

  resources :inden_cards

  resources :external_issueds

  resources :external_supplieds

  resources :add_fuels

  resources :unit_fuels do
    collection do
      get 'unit_fuel_usage'
      get 'annual_usage_report'
      get 'daily_usage'
    end
  end

  resources :fuel_balances

  resources :fuel_supplieds

  resources :fuel_issueds

  resources :depot_fuels do
    collection do
      get 'PMP_monthly_usage'
    end
  end
  
  resources :depot_fuels do 
    collection { post :import }
  end
  
  match '/public/excel_format/DepotFuel_Excel.xls', to: 'depot_fuels#download_excel_format', via: 'get', target: '_self'
  match 'import_excel_depot_fuel', to:'depot_fuels#import_excel', via: 'get'
  
  resources :fuel_types

  resources :fuel_tanks do
    collection do
      get 'tank_capacity'
    end
  end

  resources :ranks

  resources :staffs

  resources :units

  resources :unit_types

  resources :companies

  resources :contract_types

  resources :vehicle_fine_types

  resources :vehicle_assignments
  
  resources :vehicle_end_of_lives do
    member do
      get 'confirm'
      put 'confirm'
    end
  end

  resources :vehicle_cards

  resources :maintenances do
    collection do
      get 'maintenance'
    end
  end

  resources :maintenances do 
    collection { post :import }
  end

  match '/public/excel_format/Maintenance_Excel.xls', to: 'maintenances#download_excel_format', via: 'get', target: '_self'
  match 'import_excel_maintenance', to:'maintenances#import_excel', via: 'get'

  resources :contracts do
    collection do
      get 'maintenance_contract'
    end
  end

  resources :vehicle_fines do
    collection do
      get 'kembaran_a'
    end
  end
  
  resources :vehicle_fines do 
    collection { post :import }
  end
  
  match '/public/excel_format/VehicleFine_Excel.xls', to: 'vehicle_fines#download_excel_format', via: 'get', target: '_self'
  match 'import_excel_vehicle_fine', to:'vehicle_fines#import_excel', via: 'get'

  resources :vehicle_road_taxes do
    collection do
      get 'monthly_roadtax'
      get 'report_roadtax'
    end
  end

  resources :vehicle_manufacturers

  resources :vehicle_categories

  resources :vehicle_statuses

  resources :vehicles do
    collection do
      get 'vehicle_daily_report'
      get 'vehicle_monthly_report'
      get 'vehicle_yearly_report'
      get 'transport_summary_report'
      get 'vehicle_yearly_report'       
    end
  end
  
  resources :vehicles do 
    collection { post :import }
  end

  match '/public/excel_format/vehicle_excel.xls', to: 'vehicles#download_excel_format', via: 'get', target: '_self'
  match 'import_excel', to:'vehicles#import_excel', via: 'get'

  devise_for :users
  resources :users
  
  root to:  'static_pages#home'
  match '/help',    to: 'static_pages#help',    via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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

# == Route Map (Updated 2014-04-07 23:40)
#
#                             Prefix Verb   URI Pattern                                          Controller#Action
#                  maintenance_types GET    /maintenance_types(.:format)                         maintenance_types#index
#                                    POST   /maintenance_types(.:format)                         maintenance_types#create
#               new_maintenance_type GET    /maintenance_types/new(.:format)                     maintenance_types#new
#              edit_maintenance_type GET    /maintenance_types/:id/edit(.:format)                maintenance_types#edit
#                   maintenance_type GET    /maintenance_types/:id(.:format)                     maintenance_types#show
#                                    PATCH  /maintenance_types/:id(.:format)                     maintenance_types#update
#                                    PUT    /maintenance_types/:id(.:format)                     maintenance_types#update
#                                    DELETE /maintenance_types/:id(.:format)                     maintenance_types#destroy
#                     acquired_types GET    /acquired_types(.:format)                            acquired_types#index
#                                    POST   /acquired_types(.:format)                            acquired_types#create
#                  new_acquired_type GET    /acquired_types/new(.:format)                        acquired_types#new
#                 edit_acquired_type GET    /acquired_types/:id/edit(.:format)                   acquired_types#edit
#                      acquired_type GET    /acquired_types/:id(.:format)                        acquired_types#show
#                                    PATCH  /acquired_types/:id(.:format)                        acquired_types#update
#                                    PUT    /acquired_types/:id(.:format)                        acquired_types#update
#                                    DELETE /acquired_types/:id(.:format)                        acquired_types#destroy
#                         expertises GET    /expertises(.:format)                                expertises#index
#                                    POST   /expertises(.:format)                                expertises#create
#                      new_expertise GET    /expertises/new(.:format)                            expertises#new
#                     edit_expertise GET    /expertises/:id/edit(.:format)                       expertises#edit
#                          expertise GET    /expertises/:id(.:format)                            expertises#show
#                                    PATCH  /expertises/:id(.:format)                            expertises#update
#                                    PUT    /expertises/:id(.:format)                            expertises#update
#                                    DELETE /expertises/:id(.:format)                            expertises#destroy
#                          positions GET    /positions(.:format)                                 positions#index
#                                    POST   /positions(.:format)                                 positions#create
#                       new_position GET    /positions/new(.:format)                             positions#new
#                      edit_position GET    /positions/:id/edit(.:format)                        positions#edit
#                           position GET    /positions/:id(.:format)                             positions#show
#                                    PATCH  /positions/:id(.:format)                             positions#update
#                                    PUT    /positions/:id(.:format)                             positions#update
#                                    DELETE /positions/:id(.:format)                             positions#destroy
#                       inden_usages GET    /inden_usages(.:format)                              inden_usages#index
#                                    POST   /inden_usages(.:format)                              inden_usages#create
#                    new_inden_usage GET    /inden_usages/new(.:format)                          inden_usages#new
#                   edit_inden_usage GET    /inden_usages/:id/edit(.:format)                     inden_usages#edit
#                        inden_usage GET    /inden_usages/:id(.:format)                          inden_usages#show
#                                    PATCH  /inden_usages/:id(.:format)                          inden_usages#update
#                                    PUT    /inden_usages/:id(.:format)                          inden_usages#update
#                                    DELETE /inden_usages/:id(.:format)                          inden_usages#destroy
#                        inden_cards GET    /inden_cards(.:format)                               inden_cards#index
#                                    POST   /inden_cards(.:format)                               inden_cards#create
#                     new_inden_card GET    /inden_cards/new(.:format)                           inden_cards#new
#                    edit_inden_card GET    /inden_cards/:id/edit(.:format)                      inden_cards#edit
#                         inden_card GET    /inden_cards/:id(.:format)                           inden_cards#show
#                                    PATCH  /inden_cards/:id(.:format)                           inden_cards#update
#                                    PUT    /inden_cards/:id(.:format)                           inden_cards#update
#                                    DELETE /inden_cards/:id(.:format)                           inden_cards#destroy
#                   external_issueds GET    /external_issueds(.:format)                          external_issueds#index
#                                    POST   /external_issueds(.:format)                          external_issueds#create
#                new_external_issued GET    /external_issueds/new(.:format)                      external_issueds#new
#               edit_external_issued GET    /external_issueds/:id/edit(.:format)                 external_issueds#edit
#                    external_issued GET    /external_issueds/:id(.:format)                      external_issueds#show
#                                    PATCH  /external_issueds/:id(.:format)                      external_issueds#update
#                                    PUT    /external_issueds/:id(.:format)                      external_issueds#update
#                                    DELETE /external_issueds/:id(.:format)                      external_issueds#destroy
#                 external_supplieds GET    /external_supplieds(.:format)                        external_supplieds#index
#                                    POST   /external_supplieds(.:format)                        external_supplieds#create
#              new_external_supplied GET    /external_supplieds/new(.:format)                    external_supplieds#new
#             edit_external_supplied GET    /external_supplieds/:id/edit(.:format)               external_supplieds#edit
#                  external_supplied GET    /external_supplieds/:id(.:format)                    external_supplieds#show
#                                    PATCH  /external_supplieds/:id(.:format)                    external_supplieds#update
#                                    PUT    /external_supplieds/:id(.:format)                    external_supplieds#update
#                                    DELETE /external_supplieds/:id(.:format)                    external_supplieds#destroy
#                          add_fuels GET    /add_fuels(.:format)                                 add_fuels#index
#                                    POST   /add_fuels(.:format)                                 add_fuels#create
#                       new_add_fuel GET    /add_fuels/new(.:format)                             add_fuels#new
#                      edit_add_fuel GET    /add_fuels/:id/edit(.:format)                        add_fuels#edit
#                           add_fuel GET    /add_fuels/:id(.:format)                             add_fuels#show
#                                    PATCH  /add_fuels/:id(.:format)                             add_fuels#update
#                                    PUT    /add_fuels/:id(.:format)                             add_fuels#update
#                                    DELETE /add_fuels/:id(.:format)                             add_fuels#destroy
#         unit_fuel_usage_unit_fuels GET    /unit_fuels/unit_fuel_usage(.:format)                unit_fuels#unit_fuel_usage
#     annual_usage_report_unit_fuels GET    /unit_fuels/annual_usage_report(.:format)            unit_fuels#annual_usage_report
#             daily_usage_unit_fuels GET    /unit_fuels/daily_usage(.:format)                    unit_fuels#daily_usage
#                         unit_fuels GET    /unit_fuels(.:format)                                unit_fuels#index
#                                    POST   /unit_fuels(.:format)                                unit_fuels#create
#                      new_unit_fuel GET    /unit_fuels/new(.:format)                            unit_fuels#new
#                     edit_unit_fuel GET    /unit_fuels/:id/edit(.:format)                       unit_fuels#edit
#                          unit_fuel GET    /unit_fuels/:id(.:format)                            unit_fuels#show
#                                    PATCH  /unit_fuels/:id(.:format)                            unit_fuels#update
#                                    PUT    /unit_fuels/:id(.:format)                            unit_fuels#update
#                                    DELETE /unit_fuels/:id(.:format)                            unit_fuels#destroy
#                      fuel_balances GET    /fuel_balances(.:format)                             fuel_balances#index
#                                    POST   /fuel_balances(.:format)                             fuel_balances#create
#                   new_fuel_balance GET    /fuel_balances/new(.:format)                         fuel_balances#new
#                  edit_fuel_balance GET    /fuel_balances/:id/edit(.:format)                    fuel_balances#edit
#                       fuel_balance GET    /fuel_balances/:id(.:format)                         fuel_balances#show
#                                    PATCH  /fuel_balances/:id(.:format)                         fuel_balances#update
#                                    PUT    /fuel_balances/:id(.:format)                         fuel_balances#update
#                                    DELETE /fuel_balances/:id(.:format)                         fuel_balances#destroy
#                     fuel_supplieds GET    /fuel_supplieds(.:format)                            fuel_supplieds#index
#                                    POST   /fuel_supplieds(.:format)                            fuel_supplieds#create
#                  new_fuel_supplied GET    /fuel_supplieds/new(.:format)                        fuel_supplieds#new
#                 edit_fuel_supplied GET    /fuel_supplieds/:id/edit(.:format)                   fuel_supplieds#edit
#                      fuel_supplied GET    /fuel_supplieds/:id(.:format)                        fuel_supplieds#show
#                                    PATCH  /fuel_supplieds/:id(.:format)                        fuel_supplieds#update
#                                    PUT    /fuel_supplieds/:id(.:format)                        fuel_supplieds#update
#                                    DELETE /fuel_supplieds/:id(.:format)                        fuel_supplieds#destroy
#                       fuel_issueds GET    /fuel_issueds(.:format)                              fuel_issueds#index
#                                    POST   /fuel_issueds(.:format)                              fuel_issueds#create
#                    new_fuel_issued GET    /fuel_issueds/new(.:format)                          fuel_issueds#new
#                   edit_fuel_issued GET    /fuel_issueds/:id/edit(.:format)                     fuel_issueds#edit
#                        fuel_issued GET    /fuel_issueds/:id(.:format)                          fuel_issueds#show
#                                    PATCH  /fuel_issueds/:id(.:format)                          fuel_issueds#update
#                                    PUT    /fuel_issueds/:id(.:format)                          fuel_issueds#update
#                                    DELETE /fuel_issueds/:id(.:format)                          fuel_issueds#destroy
#      PMP_monthly_usage_depot_fuels GET    /depot_fuels/PMP_monthly_usage(.:format)             depot_fuels#PMP_monthly_usage
#                        depot_fuels GET    /depot_fuels(.:format)                               depot_fuels#index
#                                    POST   /depot_fuels(.:format)                               depot_fuels#create
#                     new_depot_fuel GET    /depot_fuels/new(.:format)                           depot_fuels#new
#                    edit_depot_fuel GET    /depot_fuels/:id/edit(.:format)                      depot_fuels#edit
#                         depot_fuel GET    /depot_fuels/:id(.:format)                           depot_fuels#show
#                                    PATCH  /depot_fuels/:id(.:format)                           depot_fuels#update
#                                    PUT    /depot_fuels/:id(.:format)                           depot_fuels#update
#                                    DELETE /depot_fuels/:id(.:format)                           depot_fuels#destroy
#                 import_depot_fuels POST   /depot_fuels/import(.:format)                        depot_fuels#import
#                                    GET    /depot_fuels(.:format)                               depot_fuels#index
#                                    POST   /depot_fuels(.:format)                               depot_fuels#create
#                                    GET    /depot_fuels/new(.:format)                           depot_fuels#new
#                                    GET    /depot_fuels/:id/edit(.:format)                      depot_fuels#edit
#                                    GET    /depot_fuels/:id(.:format)                           depot_fuels#show
#                                    PATCH  /depot_fuels/:id(.:format)                           depot_fuels#update
#                                    PUT    /depot_fuels/:id(.:format)                           depot_fuels#update
#                                    DELETE /depot_fuels/:id(.:format)                           depot_fuels#destroy
#                                    GET    /public/excel_format/DepotFuel_Excel.xls(.:format)   depot_fuels#download_excel_format {:target=>"_self"}
#            import_excel_depot_fuel GET    /import_excel_depot_fuel(.:format)                   depot_fuels#import_excel
#                         fuel_types GET    /fuel_types(.:format)                                fuel_types#index
#                                    POST   /fuel_types(.:format)                                fuel_types#create
#                      new_fuel_type GET    /fuel_types/new(.:format)                            fuel_types#new
#                     edit_fuel_type GET    /fuel_types/:id/edit(.:format)                       fuel_types#edit
#                          fuel_type GET    /fuel_types/:id(.:format)                            fuel_types#show
#                                    PATCH  /fuel_types/:id(.:format)                            fuel_types#update
#                                    PUT    /fuel_types/:id(.:format)                            fuel_types#update
#                                    DELETE /fuel_types/:id(.:format)                            fuel_types#destroy
#           tank_capacity_fuel_tanks GET    /fuel_tanks/tank_capacity(.:format)                  fuel_tanks#tank_capacity
#                         fuel_tanks GET    /fuel_tanks(.:format)                                fuel_tanks#index
#                                    POST   /fuel_tanks(.:format)                                fuel_tanks#create
#                      new_fuel_tank GET    /fuel_tanks/new(.:format)                            fuel_tanks#new
#                     edit_fuel_tank GET    /fuel_tanks/:id/edit(.:format)                       fuel_tanks#edit
#                          fuel_tank GET    /fuel_tanks/:id(.:format)                            fuel_tanks#show
#                                    PATCH  /fuel_tanks/:id(.:format)                            fuel_tanks#update
#                                    PUT    /fuel_tanks/:id(.:format)                            fuel_tanks#update
#                                    DELETE /fuel_tanks/:id(.:format)                            fuel_tanks#destroy
#                              ranks GET    /ranks(.:format)                                     ranks#index
#                                    POST   /ranks(.:format)                                     ranks#create
#                           new_rank GET    /ranks/new(.:format)                                 ranks#new
#                          edit_rank GET    /ranks/:id/edit(.:format)                            ranks#edit
#                               rank GET    /ranks/:id(.:format)                                 ranks#show
#                                    PATCH  /ranks/:id(.:format)                                 ranks#update
#                                    PUT    /ranks/:id(.:format)                                 ranks#update
#                                    DELETE /ranks/:id(.:format)                                 ranks#destroy
#                             staffs GET    /staffs(.:format)                                    staffs#index
#                                    POST   /staffs(.:format)                                    staffs#create
#                          new_staff GET    /staffs/new(.:format)                                staffs#new
#                         edit_staff GET    /staffs/:id/edit(.:format)                           staffs#edit
#                              staff GET    /staffs/:id(.:format)                                staffs#show
#                                    PATCH  /staffs/:id(.:format)                                staffs#update
#                                    PUT    /staffs/:id(.:format)                                staffs#update
#                                    DELETE /staffs/:id(.:format)                                staffs#destroy
#                              units GET    /units(.:format)                                     units#index
#                                    POST   /units(.:format)                                     units#create
#                           new_unit GET    /units/new(.:format)                                 units#new
#                          edit_unit GET    /units/:id/edit(.:format)                            units#edit
#                               unit GET    /units/:id(.:format)                                 units#show
#                                    PATCH  /units/:id(.:format)                                 units#update
#                                    PUT    /units/:id(.:format)                                 units#update
#                                    DELETE /units/:id(.:format)                                 units#destroy
#                         unit_types GET    /unit_types(.:format)                                unit_types#index
#                                    POST   /unit_types(.:format)                                unit_types#create
#                      new_unit_type GET    /unit_types/new(.:format)                            unit_types#new
#                     edit_unit_type GET    /unit_types/:id/edit(.:format)                       unit_types#edit
#                          unit_type GET    /unit_types/:id(.:format)                            unit_types#show
#                                    PATCH  /unit_types/:id(.:format)                            unit_types#update
#                                    PUT    /unit_types/:id(.:format)                            unit_types#update
#                                    DELETE /unit_types/:id(.:format)                            unit_types#destroy
#                          companies GET    /companies(.:format)                                 companies#index
#                                    POST   /companies(.:format)                                 companies#create
#                        new_company GET    /companies/new(.:format)                             companies#new
#                       edit_company GET    /companies/:id/edit(.:format)                        companies#edit
#                            company GET    /companies/:id(.:format)                             companies#show
#                                    PATCH  /companies/:id(.:format)                             companies#update
#                                    PUT    /companies/:id(.:format)                             companies#update
#                                    DELETE /companies/:id(.:format)                             companies#destroy
#                     contract_types GET    /contract_types(.:format)                            contract_types#index
#                                    POST   /contract_types(.:format)                            contract_types#create
#                  new_contract_type GET    /contract_types/new(.:format)                        contract_types#new
#                 edit_contract_type GET    /contract_types/:id/edit(.:format)                   contract_types#edit
#                      contract_type GET    /contract_types/:id(.:format)                        contract_types#show
#                                    PATCH  /contract_types/:id(.:format)                        contract_types#update
#                                    PUT    /contract_types/:id(.:format)                        contract_types#update
#                                    DELETE /contract_types/:id(.:format)                        contract_types#destroy
#                 vehicle_fine_types GET    /vehicle_fine_types(.:format)                        vehicle_fine_types#index
#                                    POST   /vehicle_fine_types(.:format)                        vehicle_fine_types#create
#              new_vehicle_fine_type GET    /vehicle_fine_types/new(.:format)                    vehicle_fine_types#new
#             edit_vehicle_fine_type GET    /vehicle_fine_types/:id/edit(.:format)               vehicle_fine_types#edit
#                  vehicle_fine_type GET    /vehicle_fine_types/:id(.:format)                    vehicle_fine_types#show
#                                    PATCH  /vehicle_fine_types/:id(.:format)                    vehicle_fine_types#update
#                                    PUT    /vehicle_fine_types/:id(.:format)                    vehicle_fine_types#update
#                                    DELETE /vehicle_fine_types/:id(.:format)                    vehicle_fine_types#destroy
#                vehicle_assignments GET    /vehicle_assignments(.:format)                       vehicle_assignments#index
#                                    POST   /vehicle_assignments(.:format)                       vehicle_assignments#create
#             new_vehicle_assignment GET    /vehicle_assignments/new(.:format)                   vehicle_assignments#new
#            edit_vehicle_assignment GET    /vehicle_assignments/:id/edit(.:format)              vehicle_assignments#edit
#                 vehicle_assignment GET    /vehicle_assignments/:id(.:format)                   vehicle_assignments#show
#                                    PATCH  /vehicle_assignments/:id(.:format)                   vehicle_assignments#update
#                                    PUT    /vehicle_assignments/:id(.:format)                   vehicle_assignments#update
#                                    DELETE /vehicle_assignments/:id(.:format)                   vehicle_assignments#destroy
#               vehicle_end_of_lives GET    /vehicle_end_of_lives(.:format)                      vehicle_end_of_lives#index
#                                    POST   /vehicle_end_of_lives(.:format)                      vehicle_end_of_lives#create
#            new_vehicle_end_of_life GET    /vehicle_end_of_lives/new(.:format)                  vehicle_end_of_lives#new
#           edit_vehicle_end_of_life GET    /vehicle_end_of_lives/:id/edit(.:format)             vehicle_end_of_lives#edit
#                vehicle_end_of_life GET    /vehicle_end_of_lives/:id(.:format)                  vehicle_end_of_lives#show
#                                    PATCH  /vehicle_end_of_lives/:id(.:format)                  vehicle_end_of_lives#update
#                                    PUT    /vehicle_end_of_lives/:id(.:format)                  vehicle_end_of_lives#update
#                                    DELETE /vehicle_end_of_lives/:id(.:format)                  vehicle_end_of_lives#destroy
#                      vehicle_cards GET    /vehicle_cards(.:format)                             vehicle_cards#index
#                                    POST   /vehicle_cards(.:format)                             vehicle_cards#create
#                   new_vehicle_card GET    /vehicle_cards/new(.:format)                         vehicle_cards#new
#                  edit_vehicle_card GET    /vehicle_cards/:id/edit(.:format)                    vehicle_cards#edit
#                       vehicle_card GET    /vehicle_cards/:id(.:format)                         vehicle_cards#show
#                                    PATCH  /vehicle_cards/:id(.:format)                         vehicle_cards#update
#                                    PUT    /vehicle_cards/:id(.:format)                         vehicle_cards#update
#                                    DELETE /vehicle_cards/:id(.:format)                         vehicle_cards#destroy
#           maintenance_maintenances GET    /maintenances/maintenance(.:format)                  maintenances#maintenance
#                       maintenances GET    /maintenances(.:format)                              maintenances#index
#                                    POST   /maintenances(.:format)                              maintenances#create
#                    new_maintenance GET    /maintenances/new(.:format)                          maintenances#new
#                   edit_maintenance GET    /maintenances/:id/edit(.:format)                     maintenances#edit
#                        maintenance GET    /maintenances/:id(.:format)                          maintenances#show
#                                    PATCH  /maintenances/:id(.:format)                          maintenances#update
#                                    PUT    /maintenances/:id(.:format)                          maintenances#update
#                                    DELETE /maintenances/:id(.:format)                          maintenances#destroy
#                import_maintenances POST   /maintenances/import(.:format)                       maintenances#import
#                                    GET    /maintenances(.:format)                              maintenances#index
#                                    POST   /maintenances(.:format)                              maintenances#create
#                                    GET    /maintenances/new(.:format)                          maintenances#new
#                                    GET    /maintenances/:id/edit(.:format)                     maintenances#edit
#                                    GET    /maintenances/:id(.:format)                          maintenances#show
#                                    PATCH  /maintenances/:id(.:format)                          maintenances#update
#                                    PUT    /maintenances/:id(.:format)                          maintenances#update
#                                    DELETE /maintenances/:id(.:format)                          maintenances#destroy
#                                    GET    /public/excel_format/Maintenance_Excel.xls(.:format) maintenances#download_excel_format {:target=>"_self"}
#           import_excel_maintenance GET    /import_excel_maintenance(.:format)                  maintenances#import_excel
#     maintenance_contract_contracts GET    /contracts/maintenance_contract(.:format)            contracts#maintenance_contract
#                          contracts GET    /contracts(.:format)                                 contracts#index
#                                    POST   /contracts(.:format)                                 contracts#create
#                       new_contract GET    /contracts/new(.:format)                             contracts#new
#                      edit_contract GET    /contracts/:id/edit(.:format)                        contracts#edit
#                           contract GET    /contracts/:id(.:format)                             contracts#show
#                                    PATCH  /contracts/:id(.:format)                             contracts#update
#                                    PUT    /contracts/:id(.:format)                             contracts#update
#                                    DELETE /contracts/:id(.:format)                             contracts#destroy
#           kembaran_a_vehicle_fines GET    /vehicle_fines/kembaran_a(.:format)                  vehicle_fines#kembaran_a
#                      vehicle_fines GET    /vehicle_fines(.:format)                             vehicle_fines#index
#                                    POST   /vehicle_fines(.:format)                             vehicle_fines#create
#                   new_vehicle_fine GET    /vehicle_fines/new(.:format)                         vehicle_fines#new
#                  edit_vehicle_fine GET    /vehicle_fines/:id/edit(.:format)                    vehicle_fines#edit
#                       vehicle_fine GET    /vehicle_fines/:id(.:format)                         vehicle_fines#show
#                                    PATCH  /vehicle_fines/:id(.:format)                         vehicle_fines#update
#                                    PUT    /vehicle_fines/:id(.:format)                         vehicle_fines#update
#                                    DELETE /vehicle_fines/:id(.:format)                         vehicle_fines#destroy
#               import_vehicle_fines POST   /vehicle_fines/import(.:format)                      vehicle_fines#import
#                                    GET    /vehicle_fines(.:format)                             vehicle_fines#index
#                                    POST   /vehicle_fines(.:format)                             vehicle_fines#create
#                                    GET    /vehicle_fines/new(.:format)                         vehicle_fines#new
#                                    GET    /vehicle_fines/:id/edit(.:format)                    vehicle_fines#edit
#                                    GET    /vehicle_fines/:id(.:format)                         vehicle_fines#show
#                                    PATCH  /vehicle_fines/:id(.:format)                         vehicle_fines#update
#                                    PUT    /vehicle_fines/:id(.:format)                         vehicle_fines#update
#                                    DELETE /vehicle_fines/:id(.:format)                         vehicle_fines#destroy
#                                    GET    /public/excel_format/VehicleFine_Excel.xls(.:format) vehicle_fines#download_excel_format {:target=>"_self"}
#          import_excel_vehicle_fine GET    /import_excel_vehicle_fine(.:format)                 vehicle_fines#import_excel
# monthly_roadtax_vehicle_road_taxes GET    /vehicle_road_taxes/monthly_roadtax(.:format)        vehicle_road_taxes#monthly_roadtax
#  report_roadtax_vehicle_road_taxes GET    /vehicle_road_taxes/report_roadtax(.:format)         vehicle_road_taxes#report_roadtax
#                 vehicle_road_taxes GET    /vehicle_road_taxes(.:format)                        vehicle_road_taxes#index
#                                    POST   /vehicle_road_taxes(.:format)                        vehicle_road_taxes#create
#               new_vehicle_road_tax GET    /vehicle_road_taxes/new(.:format)                    vehicle_road_taxes#new
#              edit_vehicle_road_tax GET    /vehicle_road_taxes/:id/edit(.:format)               vehicle_road_taxes#edit
#                   vehicle_road_tax GET    /vehicle_road_taxes/:id(.:format)                    vehicle_road_taxes#show
#                                    PATCH  /vehicle_road_taxes/:id(.:format)                    vehicle_road_taxes#update
#                                    PUT    /vehicle_road_taxes/:id(.:format)                    vehicle_road_taxes#update
#                                    DELETE /vehicle_road_taxes/:id(.:format)                    vehicle_road_taxes#destroy
#              vehicle_manufacturers GET    /vehicle_manufacturers(.:format)                     vehicle_manufacturers#index
#                                    POST   /vehicle_manufacturers(.:format)                     vehicle_manufacturers#create
#           new_vehicle_manufacturer GET    /vehicle_manufacturers/new(.:format)                 vehicle_manufacturers#new
#          edit_vehicle_manufacturer GET    /vehicle_manufacturers/:id/edit(.:format)            vehicle_manufacturers#edit
#               vehicle_manufacturer GET    /vehicle_manufacturers/:id(.:format)                 vehicle_manufacturers#show
#                                    PATCH  /vehicle_manufacturers/:id(.:format)                 vehicle_manufacturers#update
#                                    PUT    /vehicle_manufacturers/:id(.:format)                 vehicle_manufacturers#update
#                                    DELETE /vehicle_manufacturers/:id(.:format)                 vehicle_manufacturers#destroy
#                 vehicle_categories GET    /vehicle_categories(.:format)                        vehicle_categories#index
#                                    POST   /vehicle_categories(.:format)                        vehicle_categories#create
#               new_vehicle_category GET    /vehicle_categories/new(.:format)                    vehicle_categories#new
#              edit_vehicle_category GET    /vehicle_categories/:id/edit(.:format)               vehicle_categories#edit
#                   vehicle_category GET    /vehicle_categories/:id(.:format)                    vehicle_categories#show
#                                    PATCH  /vehicle_categories/:id(.:format)                    vehicle_categories#update
#                                    PUT    /vehicle_categories/:id(.:format)                    vehicle_categories#update
#                                    DELETE /vehicle_categories/:id(.:format)                    vehicle_categories#destroy
#                   vehicle_statuses GET    /vehicle_statuses(.:format)                          vehicle_statuses#index
#                                    POST   /vehicle_statuses(.:format)                          vehicle_statuses#create
#                 new_vehicle_status GET    /vehicle_statuses/new(.:format)                      vehicle_statuses#new
#                edit_vehicle_status GET    /vehicle_statuses/:id/edit(.:format)                 vehicle_statuses#edit
#                     vehicle_status GET    /vehicle_statuses/:id(.:format)                      vehicle_statuses#show
#                                    PATCH  /vehicle_statuses/:id(.:format)                      vehicle_statuses#update
#                                    PUT    /vehicle_statuses/:id(.:format)                      vehicle_statuses#update
#                                    DELETE /vehicle_statuses/:id(.:format)                      vehicle_statuses#destroy
#      vehicle_daily_report_vehicles GET    /vehicles/vehicle_daily_report(.:format)             vehicles#vehicle_daily_report
#    vehicle_monthly_report_vehicles GET    /vehicles/vehicle_monthly_report(.:format)           vehicles#vehicle_monthly_report
#     vehicle_yearly_report_vehicles GET    /vehicles/vehicle_yearly_report(.:format)            vehicles#vehicle_yearly_report
#  transport_summary_report_vehicles GET    /vehicles/transport_summary_report(.:format)         vehicles#transport_summary_report
#                                    GET    /vehicles/vehicle_yearly_report(.:format)            vehicles#vehicle_yearly_report
#                           vehicles GET    /vehicles(.:format)                                  vehicles#index
#                                    POST   /vehicles(.:format)                                  vehicles#create
#                        new_vehicle GET    /vehicles/new(.:format)                              vehicles#new
#                       edit_vehicle GET    /vehicles/:id/edit(.:format)                         vehicles#edit
#                            vehicle GET    /vehicles/:id(.:format)                              vehicles#show
#                                    PATCH  /vehicles/:id(.:format)                              vehicles#update
#                                    PUT    /vehicles/:id(.:format)                              vehicles#update
#                                    DELETE /vehicles/:id(.:format)                              vehicles#destroy
#                    import_vehicles POST   /vehicles/import(.:format)                           vehicles#import
#                                    GET    /vehicles(.:format)                                  vehicles#index
#                                    POST   /vehicles(.:format)                                  vehicles#create
#                                    GET    /vehicles/new(.:format)                              vehicles#new
#                                    GET    /vehicles/:id/edit(.:format)                         vehicles#edit
#                                    GET    /vehicles/:id(.:format)                              vehicles#show
#                                    PATCH  /vehicles/:id(.:format)                              vehicles#update
#                                    PUT    /vehicles/:id(.:format)                              vehicles#update
#                                    DELETE /vehicles/:id(.:format)                              vehicles#destroy
#                                    GET    /public/excel_format/vehicle_excel.xls(.:format)     vehicles#download_excel_format {:target=>"_self"}
#                       import_excel GET    /import_excel(.:format)                              vehicles#import_excel
#                   new_user_session GET    /users/sign_in(.:format)                             devise/sessions#new
#                       user_session POST   /users/sign_in(.:format)                             devise/sessions#create
#               destroy_user_session DELETE /users/sign_out(.:format)                            devise/sessions#destroy
#                      user_password POST   /users/password(.:format)                            devise/passwords#create
#                  new_user_password GET    /users/password/new(.:format)                        devise/passwords#new
#                 edit_user_password GET    /users/password/edit(.:format)                       devise/passwords#edit
#                                    PATCH  /users/password(.:format)                            devise/passwords#update
#                                    PUT    /users/password(.:format)                            devise/passwords#update
#           cancel_user_registration GET    /users/cancel(.:format)                              devise/registrations#cancel
#                  user_registration POST   /users(.:format)                                     devise/registrations#create
#              new_user_registration GET    /users/sign_up(.:format)                             devise/registrations#new
#             edit_user_registration GET    /users/edit(.:format)                                devise/registrations#edit
#                                    PATCH  /users(.:format)                                     devise/registrations#update
#                                    PUT    /users(.:format)                                     devise/registrations#update
#                                    DELETE /users(.:format)                                     devise/registrations#destroy
#                              users GET    /users(.:format)                                     users#index
#                                    POST   /users(.:format)                                     users#create
#                           new_user GET    /users/new(.:format)                                 users#new
#                          edit_user GET    /users/:id/edit(.:format)                            users#edit
#                               user GET    /users/:id(.:format)                                 users#show
#                                    PATCH  /users/:id(.:format)                                 users#update
#                                    PUT    /users/:id(.:format)                                 users#update
#                                    DELETE /users/:id(.:format)                                 users#destroy
#                               root GET    /                                                    static_pages#home
#                               help GET    /help(.:format)                                      static_pages#help
#                              about GET    /about(.:format)                                     static_pages#about
#                            contact GET    /contact(.:format)                                   static_pages#contact
#
