Rails.application.routes.draw do
  get 'archivos/subir_archivos'

  resources :donations

  resources :applications

  resources :loans

  resources :specifications

  resources :requisitions

  resources :quotes
  resources :devolutions
  resources :acts

  get 'acto_motivado/index'

  get 'nota_devolucion/index'

  get 'ofertas/index'

  get 'informe_recomendacion/index'

  get 'loans/index2'

  get 'loans/show2'

  post 'loans/new'

  resources :invitations
  resources :services
  resources :items
  resources :chemical_substances
  resources :consumables
  resources :tools
  resources :instruments
  resources :equipment
  resources :recommendations
  resources :relations
  resources :requests
  resources :comprando do
    collection do
        get 'seleccionarEspecificacion', as: :seleccionarEspecificacion
    end
end

  devise_for :users,
              :controllers => {:registrations => "my_devise/registrations"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".
  
  get "inventario" => "statics#inventario", :as => "inventario"
  get "prestamos" => "statics#prestamos", :as => "prestamos"

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root 'statics#index'

  # Rutas del Subsistema de Compras
  get "/compras", to: "comprando#compras", :as => "compras"
  get "/solicitud", to: "comprando#solicitud", :as => "solicitud"
  get "/especificacionesTecnicas", to: "comprando#especificacionesTecnicas", :as => "especificacionesTecnicas"
  get "/construccion", to: "comprando#construccion", :as => "construccion"
  #get "compras" => "#compras", :as => "compras"
  #get "solicitud" => "Comprando#solicitud", :as => "solicitud"
  #get "especificacionesTecnicas" => "Comprando#especificacionesTecnicas", :as => "especificacionesTecnicas"
  #get "construccion" => "Comprando#construccion", :as => "construccion"
  
  # Rutas del Subsistema de Administracion
  get 'administration/budget/(:action)', to: 'budget', as: :budget
  get 'administration/(:action)', to: 'administration', as: :administration
  get "/executions/list", to: "executions#list", :as => "executions/list"

  resources :incomes
  resources :commitments
  resources :executions do 
    get 'annul', on: :member
  end
  resources :projects
 


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
