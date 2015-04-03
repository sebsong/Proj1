Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  patch '/damage' => 'pokemon#damage'
  patch '/capture' => 'pokemon#capture'
  get 'new_poke', to: 'pokemons#new'
  post 'new_poke', to: 'pokemons#create', as: :pokemons
end
