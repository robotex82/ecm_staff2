Ecm::Staff::Engine.routes.draw do
  localized do
    scope :ecm_staff_engine do
      resources :organisations,  only: [:show, :index]
      resources :business_units, only: [:show, :index]
      resources :people,         only: [:show, :index]
      
      root to: 'people#index'
    end
  end
end
