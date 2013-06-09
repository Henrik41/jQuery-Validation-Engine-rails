Devisealone::Application.routes.draw do

            


  get "view_users/index"

  get "view_users/show"

  get "search/index"
  post "search/index"

  get "search/company"

  get "search/item"

  get "search/person"


  resources :albums

  resources :category2s

  resources :addinfos

  resources :parametres
  

  
  resources :objs do 
    member do
     post :save_comment
   end
    member do
      post :rate
    end
  end
  post "objs/follow"
 
  post "objs/unfollow"
  get "myinfo/show"
  get "myinfo/showbiz"

  get "myinfo/create"
  post "myinfo/create"

  get "myinfo/update"

  get "myinfo/destroy"
  post "objs/save_comment_through_index"
 
match "remove_comment" => "objs#remove_comment"
  resources :specs
  resources :bizspecs

  get "welcome/index"
  resources :users do
              resources :messages do
                collection do
                  post :delete_selected
                end
              end
              
            end

  devise_for :users, :path => 'accounts'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
    # match 'users/:id/messages' => 'messages#', :as => :purchase
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
 
  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "myinfo#show"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
