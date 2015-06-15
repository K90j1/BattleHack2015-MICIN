Elog::Application.routes.draw do
  resources :locations
  post 'locations/fault'
  post 'takeover/index'
  post 'scan/index'
	root :to=> 'takeover#index'

end
