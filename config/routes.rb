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
