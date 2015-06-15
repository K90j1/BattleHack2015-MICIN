Elog::Application.routes.draw do
  resources :locations
  post 'locations/fault'
  get 'takeover/index'
  post 'scan/index'
	root :to=> 'takeover#index'

end
