Rails.application.routes.draw do

   root 'application#index'

   post '/login' => 'sessions#create'
   delete '/logout/:id' => 'sessions#destroy'

   resources :users

   resources :products

   post '/buy/:id' => 'sales#create'


end
