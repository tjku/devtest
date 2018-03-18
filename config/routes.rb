Rails.application.routes.draw do
  scope module: 'api' do
    get 'locations/:country_code', to: 'locations#index'
  end
end
