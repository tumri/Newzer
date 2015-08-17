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

  get       'reported'                 => 'articles#reported'

  get       'approved'                 => 'articles#approved'

  get       'featured'                 => 'articles#featured'

  get       'flagged'                  => 'comments#flagged'

  get       '/comments/new/(:parent_id)',
            to: 'comments#new',
            as: :new_comment

  get       'categories'               => 'categories#index'

  resources :users do
    member { post :promote }
  end

  post      'promote_user'             => 'users#promote'

  resources :account_activations,
            only: [:edit]

  resources :password_resets,
            only: [:new, :create, :edit, :update]

  resources :articles do
    resources :comments, shallow: true
    member { post :report }
    member { post :approve }
    member { post :feature }
  end

  post      'report_article'           => 'articles#report'
  post      'approve_article'          => 'articles#approve'
  post      'feature_article'          => 'articles#feature'

  resources :comments do
    member { post :flag }
    member { post :unflag }
  end

  post      'flag_comment'             => 'comments#flag'
  post      'unflag_comment'           => 'comments#unflag'

  resources :categories,
            only: [:index, :show]
end
