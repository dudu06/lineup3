Lineup3::Application.routes.draw do

root 'pages#home'
resources :barbers
resources :customers
resources :haircuts
resources :sessions, only: [:new, :create, :destroy]
get 'pages/landing' => 'pages#landing'
# mount FullcalendarEngine::Engine => "/fullcalendar_engine"




end
