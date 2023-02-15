Rails.application.routes.draw do
  get 'choices', to: 'games#choices'
  post 'play', to: 'games#play'
end
