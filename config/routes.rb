Rails.application.routes.draw do
  get 'reviews/show'

  get 'reviews/index'

  get 'reviews/new'

  get 'reviews/destroy'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cocktails, except: [:edit, :update] do
    resources :reviews, except: [:edit,:update]
    resources :doses, except: [:index, :show, :update, :edit, :update, :destroy]
  end

  resources :doses, only: [:destroy]

  root to: 'cocktails#index'
end
