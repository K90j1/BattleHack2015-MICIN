Elog::Application.routes.draw do
	post 'result/index'
  get 'takeover/index'
  post 'scan/index'

  get 'static_pages/list'
  get 'static_pages/details'
	resources :users, :shallow=> true do
		resources :logs
	end
  resources :sessions, :only=> [:new, :create, :destroy]
  root :to=> 'takeover#index'
  get '/signup',  :to=> 'users#new'
  get '/signin',  :to=> 'sessions#new'
  delete '/signout', :to=> 'sessions#destroy'#, :via=> :delete

	get '/auth/:provider/callback', to: 'sessions#create_soical', via: [:get, :post]
	get 'auth/failure', to: redirect('/'), via: [:get, :post]

end
