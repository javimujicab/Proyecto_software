Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'comments/create'
  get 'comments/edit'
  get 'comments/update'
  get 'comments/destroy'
  resources :posts
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                     path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  root to: 'home#index'
  get 'home/index'
  devise_scope :user do # rutas dentro de una cuenta
    get '/posts', to: 'posts#index', as: 'posts_index'
    get '/posts/new', to: 'posts#new', as: 'new_posts'
    post '/posts', to: 'posts#create', as:'posts_create'
    get '/posts/:id', to: 'posts#show', as: 'post_show'
    put '/posts/:id', to: 'posts#update'
    put '/posts/:id/edit', to: 'posts#edit', as: 'editing_post'
    delete '/posts/:id', to: 'posts#destroy'
    delete '/comments/:id', to: 'comments#destroy'

    get '/posts/:post_id/solicits', to:          'solicits#index', as: 'solicits'
    delete '/posts/:post_id/solicits/:solicit_id', to: 'solicits#destroy', as: 'delete_solicit'
    post '/posts/:post_id/solicits/:solicit_id/aceptar', to: 'solicits#aceptar', as: 'aceptar_solicit'
    post '/posts/:post_id/solicits/:solicit_id/rechazar', to: 'solicits#rechazar', as: 'rechazar_solicit'

    post   '/posts/:post_id/solicits', to:         'solicits#create', as: 'create_solicit'
    get    '/posts/:post_id/solicits/new', to:     'solicits#new', as: 'new_solicit'
    patch  '/posts/:post_id/solicits/:id', to: 'solicits#update'
  end
  resources :posts do
    resources :comments
  end
  resources :posts do
    resources :comments, only: [:create]
  end
  
  resources :conversations do
    resources :messages
  end
  
  get '/calendar/:post_id', to: 'calendars#index', as: 'calendar'

  get '/perfil', to: 'home#perfil', as: 'perfil'
  delete '/conversations/:conversation_id/messages/:id', to: 'messages#destroy', as: 'destroy_message'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
