Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/profile', to: 'pages#profile'

  resources :plants do
    resources :bookings, only: [:new, :create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# /	GET	plants	home
# /	GET	plants	index
# /	POST	plants	search
# /devise	GET	devise	login
# /plants/:id/booking/new	GET / POST	bookings	new/create
# /plant/:id	GET		show
# /plant/new	POST/GET		new/create
# /plant/:id	GET/PATCH	plants	edit/update
# /dashboard	GET	dashboard	profile