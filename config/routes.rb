Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'api/fibonacci/:position',           to: 'fibonacci#get_position'
  post 'api/fibonacci/:position/acumulate', to: 'fibonacci#acumulate'
end
