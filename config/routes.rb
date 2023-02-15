Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'choices', to: 'games#choices'
  post 'play', to: 'games#play'
end
