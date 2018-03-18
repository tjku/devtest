Rails.application.routes.draw do
  scope module: 'api' do
    get 'locations/:country_code', to: 'locations#index'
    get 'target_groups/:country_code', to: 'target_groups#index'
  end
end
