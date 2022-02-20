Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'
  resources :questions do 
    resources :answers, except: [:new, :show]
  end
  get 'user.params[:id]', to: 'registrations#edit'
  get "signup", to: "users#new"
  resources :users, except: [:new]
  devise_scope :user do
      get "login" => "devise/sessions#new"
      post 'login', to: 'devise/sessions#create'
      delete 'logout', to: 'devise/sessions#destroy'
  end
   resources :pictures
  
end
