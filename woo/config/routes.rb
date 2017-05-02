Woo::Application.routes.draw do

 

  resources :dares


  get "notif/index"
  post "notif/create"

  get "info/about"

  get "info/faq"

  get "info/terms"

  get "setting/index"

  get "activity/:id", to: 'general#activity'

  get "people/index"

  get 'start/uservalide'
  
  get "general/activity/:id", to: 'general#activity'
  
  post 'general/notification'
  get 'general/notification'
  post 'general/invite/:id', to: 'general#invite'
  
  post "activities/invites/:id", to: 'activities#invites'
  
  get 'general/invite'
  
  get "info/my_activity/:id", to: 'info#my_activity'

#general


post "general/newsletter", to: 'general#newsletter'
post "general/follow/:id", to: 'general#follow'
post "general/followdash/:id", to: 'general#followdash'

post "general/unfollow/:id", to: 'general#unfollow'

post "general/follow2/:id", to: 'general#follow2'

post "general/unfollow2/:id", to: 'general#unfollow2'
post "general/deletenotif/:id", to: 'general#deletenotif'

post "general/follow3/:id", to: 'general#follow3'
post "general/follow4/:id", to: 'general#follow4'
post "general/unfollow3/:id", to: 'general#unfollow3'
post "general/followall/:id", to: 'general#followall'
#search routes
  post "search/searchactivities"
  post "search/searchbycity"
    post "search/peoplesearch"
  get "search/activitysearch"
  get "search/peoplesearch"
 
  
#conversation
  get "conversation/index"
  get "conversation/new"
  get "conversation/show"
  post "conversation/reply"
  get '/conversation/index/:id', to: 'conversation#index'
  get 'conversation/myinbox'
  get 'conversation/myoutbox'  
  post 'conversation', to: 'conversation#trash', as: :trash 
  post 'conversation/sendmail/:id', to: 'conversation#sendmail'
  post 'conversation/sendmail2/:id', to: 'conversation#sendmail2'
  get "/contacts/failure" => "invites#failure"
  
#profile
  get 'activities/myactivities'
  get 'profile/edit/:id', to: 'profile#edit'
  get "profile/edit", to: 'profile#edit', as: 'profilepage'
  get '/profile/:id', to: 'profile#show'
  put 'profile/update'
  put 'profile/updatepic'
  

# Follow
  
  match 'follow/list' => 'follow#list'
  get "follow/ifollow"

#show all photos
  
  get "photos/index"
  match 'show' => 'photos#show', :as => :photo
  post "start/accept"
  post "photos/show2"
  get "photos/show2"
  
  
#starting page
  get "start/index"
  get "start/dashboard"
  get "start/dashboard2"
  get "start/dashboard/:id" => "start#dashboard"
  
  post "yactivities/yesbutton"
  post "yactivities/nobutton"

   get "yactivities/home"
   get "yactivities/home/:id" => "yactivities#home"
     resources :yactivities 
#to check
  get "/activities/back_to_edit" 
  #get emails from gmail/others
    get "/contacts/:provider/contact_callback" => "invites#index"
    get "/contacts/hotmail/callback" => "invites#index"
    
#contact
    match 'contact' => 'contact#new', :as => 'contact', :via => :get
    match 'contact' => 'contact#create', :as => 'contact', :via => :post
     post 'contact/alerte/:id/:activity' => 'contact#alerte'
     
devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks", confirmations: 'confirmations'   }


devise_for :admin_users, ActiveAdmin::Devise.config

begin
    ActiveAdmin.routes(self)
rescue Exception => e
    puts "ActiveAdmin: #{e.class}: #{e}"
end



  # resources

    resources :profile do
      member do
        get :follow
        get :unfollow
        get :block
        get :unblock
      end
    end
   put 'setting/update'
    resources :settings
    resources :albums 
    resources :activities
resources :events
match '/users/:id' => 'profile#show', :via => [:get], :as => "user" 
  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end
   root :to => "start#index"
  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
 
# You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   #root :to => 'activities#index'

  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
