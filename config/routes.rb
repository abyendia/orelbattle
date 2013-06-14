Battle::Application.routes.draw do
  
  

  resources :feedbacks, :only => [:new, :create] do
    collection do
      get :thank_you
    end  
  end  

  class ForRedirectFromGeneralPage 
    def self.matches?(request)
      return false unless Buttle.where(:published => true).first;
      return true
    end  
  end  
#  get "/buttles/#{Buttle.where(:published => true).first.id}", :as => :root
  constraints ForRedirectFromGeneralPage do
    match "/" => redirect {| p,request | "/buttles/#{Buttle.in_general_page.id}" }
    # root :to => "buttles#show", :id => Buttle.where(:published => true).first.id
  end  
  match "/" => "buttles#index"

  resources :buttles  
  #Лоты доступны только через админку
  #resources :lots do
  #  collection do       
  #    get :one_lot
  #  end
  #  member do 
  #  end  
  #end

  namespace :myadmin do
    match "/" => "index#index"
    resources :buttles
    resources :feedbacks do
      member do 
        post :to_read_message
      end  
      collection do
        get :massmove
      end  
    end  

    resources :lots do
      collection do       
        get :one_lot
      end
      member do 
      end  
    end  

    resources :options do
      member do
        post :quick_update
      end  
      collection do
        get :massmove
      end  
    end  

    get '/votes' => 'votes#all'

  end  #myadmin
      

  resources :votes, :only => :new  
    
  match "/home", :to => "pages#home"
  

  root :to => "pages#home"


  # The priority is based upon order of creation:
  # first created -> highest priority.

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

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
