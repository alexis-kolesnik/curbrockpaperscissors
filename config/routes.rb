Rails.application.routes.draw do
  root 'curbrockpaperscissors#index'

  get '/play', to: 'curbrockpaperscissors#play'
  get '/choice/:state', to: 'curbrockpaperscissors#choice', as: :choice
end
