SimpleChatFour::Application.routes.draw do
  root to: 'chats#index'
  resources :users
  get 'sessions/new' => 'sessions#new'
  post 'sessions' => 'sessions#create'
  post '/chats/send_chat', to: 'chats#send_chat', as: 'send_chat'
  delete 'logout' => 'sessions#destroy'
end
