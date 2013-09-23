NLADb::Application.routes.draw do

  resources :students do
    collection do
      get 'modify'
    end
  end
  resources :people do
    collection do
      get 'change_fields'
    end
  end
  
  resource :bulk_import, :only => [:index] do 
    collection do
      get 'step1'
      post 'step2'
    end
  end
  
  resources :interests, only:[:new, :create, :edit, :update]
  resources :allergies, only:[:new, :create, :edit, :update]
  resources :medications, only:[:new, :create, :edit, :update]
  resources :support_services, only:[:new, :create, :edit, :update]

  resources :schools, except: [:destroy] do
    collection do
      get 'modify'
    end
  end

  resources :volunteers do
    collection do
      get 'modify'
    end
  end


  resources :employees do
    collection do
      get 'modify'
    end
  end


  resources :program_locations, except:[:index, :destroy] do
    member do
      get 'attendance'
    end
  end

  resources :program_enrollments, only:[:create, :update, :destroy]
  resources :programs do
    collection do
      get 'modify'
    end

    member do
      get 'modify_locations'
      get 'new_location'
      get 'enroll_student'
    end
  end

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
