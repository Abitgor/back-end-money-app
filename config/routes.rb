Rails.application.routes.draw do
  devise_for :users, path: 'api/', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
    },
    controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }

  namespace :api do
    namespace :v1 do
      resources :categories do
        resources :costs, controller: "categories/costs"
      end
      resources :users, only: %i[] do
        collection do
          get :user_details
          patch :update_profile
          put :update_profile
        end
      end
      resources :costs
      resources :incomes
    end
  end
end
