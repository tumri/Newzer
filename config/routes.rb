Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  root      'static_pages#home'

  get       'home'                     => 'static_pages#home'

  get       'help'                     => 'static_pages#help'

  get       'about'                    => 'static_pages#about'

  get       'contact'                  => 'static_pages#contact'

  get       'signup'                   => 'users#new'

  get       'login'                    => 'sessions#new'

  post      'login'                    => 'sessions#create'

  delete    'logout'                   => 'sessions#destroy'

  get       'password_resets/new'

  get       'password_resets/edit'

  get       'sessions/new'

  get       'articles'                 => 'articles#index'

  get       'featured'                 => 'articles#featured'

  get       'categories'               => 'categories#index'

  resources :users

  resources :account_activations, only: [:edit]

  resources :password_resets,     only: [:new, :create, :edit, :update]

  resources :articles do
    resources :comments
    member { post :approve }
    member { post :feature }
  end

  post      'approve_article'          => 'articles#approve'
  post      'feature_article'          => 'articles#feature'

  resources :comments

  resources :categories,          only: [:index, :show]
end
