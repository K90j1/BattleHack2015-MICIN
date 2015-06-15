Elog::Application.routes.draw do
  resources :locations

  get 'takeover/index'
  post 'scan/index'
	root :to=> 'takeover#index'

end
