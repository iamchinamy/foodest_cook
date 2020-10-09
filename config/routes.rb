Rails.application.routes.draw do
  devise_for :producers, controllers: {
  	sessions: 'producers/sessions',
  	registrations: 'producers/registrations',
  	passwords: 'producers/passwords'
  }

  root 'homes#top'

  get 'about' => 'homes#about'

  namespace :producer do
    resources :producers, only: [:index, :show]
    resources :homes, only: [:edit, :update] do
      collection do
        get 'my_page' => 'homes#my_page'
      end
    end
    resources :recipes do
      resource :likes, only: [:create, :destroy]
    end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
