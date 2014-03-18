Ocutec::Application.routes.draw do
  devise_for :users, :controllers => { :sessions => "admin/sessions" }
  
  root 'statics#index'

  get 'services'    => 'statics#services'
  get 'about_us'    => 'statics#about_us'
  get 'promotions'  => 'statics#promotions'
  get 'events'    => 'statics#events'
  get 'magazine'    => 'statics#magazine'
  get 'contact_us'  => 'statics#contact_us'
  
  get 'materials'  => 'statics#materials'
  get 'technology'  => 'statics#technology'
  get 'treatments'  => 'statics#treatments'
  get 'milling'  => 'statics#milling'
  get 'futurex'  => 'statics#futurex'
  get 'type_of_glasses'  => 'statics#type_of_glasses'

  namespace :admin do
    root 'dashboard#index'

    get  'dashboard'                    => 'dashboard#index'
    get  'edit_home'                    => 'statics#edit_home'
    get  'edit_about_us'                => 'statics#edit_about_us'
    get  'edit_promotion'               => 'statics#edit_promotion'
    get  'edit_events'                  => 'statics#edit_events_us'
    get  'edit_contact_us'              => 'statics#edit_contact_us'
    
    get  'edit_technology'              => 'statics#edit_technology'

    post 'update_sections'              => 'sections#update_sections'

    resources :pages do
      resources :sections
    end
    resources :users do
      collection do
        get 'administrators'
        get 'customers'
      end
    end
    resources :access_requests
  end
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
