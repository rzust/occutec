Ocutec::Application.routes.draw do
  devise_for :users, :controllers => { :sessions => "admin/sessions" }
  
  root 'statics#index'

  # get 'services'    => 'statics#services'
  get 'about_us'    => 'statics#about_us'
  get 'promotions'  => 'statics#promotions'
  # get 'events'    => 'statics#events'
  get 'magazine'    => 'statics#magazine'
  get 'contact_us'  => 'statics#contact_us'
  
  get 'materials'  => 'statics#materials'
  get 'technology'  => 'statics#technology'
  get 'treatments'  => 'statics#treatments'
  get 'milling'  => 'statics#milling'
  get 'futurex'  => 'statics#futurex'
  get 'type_of_glasses'  => 'statics#type_of_glasses'

  resources :products
  resources :messages
  resources :events do 
    resources :event_images
  end
  
  namespace :admin do
    root 'dashboard#index'

    get  'dashboard'                    => 'dashboard#index'
    get  'edit_home'                    => 'statics#edit_home'
    get  'edit_about_us'                => 'statics#edit_about_us'
    get  'edit_promotion'               => 'statics#edit_promotion'
    get  'edit_events'                  => 'statics#edit_events_us'
    get  'edit_contact_us'              => 'statics#edit_contact_us'
    
    get  'edit_technology'              => 'statics#edit_technology'
    get  'edit_treatments'              => 'statics#edit_treatments'
    get  'edit_milling'                 => 'statics#edit_milling'
    get  'edit_futurex'                 => 'statics#edit_futurex'
    get  'edit_materials'               => 'statics#edit_materials'
    get  'edit_type_of_glasses'         => 'statics#edit_type_of_glasses'

    post 'update_sections'              => 'sections#update_sections'


    get 'panel/:id' => 'statics#panel'
    get 'edit_section/:id' => 'statics#edit_section'

    resources :pages do
      resources :gallery_images
      resources :sections
    end

    resources :messages
    resources :contacts do
      collection do 
        get 'edit_main'
      end
    end
    resources :products do 
      resources :gallery_images
      collection do
        get 'add_section'
      end
      member do
        get 'images_panel'
      end
    end
    resources :main_slider_images do
      collection do
        get 'panel'
      end
    end
    resources :gallery_images

    resources :events do
      resources :event_images
      member do 
        get 'images_panel'
      end
    end

    resources :event_images
    
    resources :users do
      collection do
        get 'administrators'
        get 'customers'
      end
    end
    resources :access_requests
    resources :categories
  end
  #get "*path" => 'home#show'
end
