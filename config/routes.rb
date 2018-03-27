Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  scope module: 'api', defaults: { format: 'json' } do
    get 'locations/:country_code', to: 'locations#index'
    get 'target_groups/:country_code', to: 'target_groups#index'
  end
end
