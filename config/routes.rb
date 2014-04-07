Elog::Application.routes.draw do
  get 'static_pages/list'
  get 'static_pages/details'
	resources :users, :shallow=> true do
		resources :logs
	end
  resources :sessions, :only=> [:new, :create, :destroy]
  root :to=> 'logs#index'
  get '/signup',  :to=> 'users#new'
  get '/signin',  :to=> 'sessions#new'
  delete '/signout', :to=> 'sessions#destroy'#, :via=> :delete

end
