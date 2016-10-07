Ecm::Staff::Engine.routes.draw do
  localized do
    resources :organisations
    resources :business_units
    resources :people
  end
end
