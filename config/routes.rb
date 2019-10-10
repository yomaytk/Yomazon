Rails.application.routes.draw do

  get 'users/new'
	root	'static_pages#home'
	get '/contact', to: 'static_pages#contact'
	get '/signup', to: 'users#new'
	post '/signup', to: 'users#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
