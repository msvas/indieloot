Rails.application.routes.draw do
  #rotas públicas que não são dependentes de perfil de cliente ou fornecedor; a maioria não exige autenticação
  devise_for :users

  devise_scope :user do
    get 'assinar', to: 'devise/registrations#new'
    get 'entrar', to: 'devise/sessions#new'
    get 'sair', to: 'devise/sessions#destroy'
    #get 'cadastro', to: 'devise/registrations#edit'
    #get 'perfil-cliente', to: 'clients#edit'
    #get 'recuperar-senha', to: 'devise/passwords#new'
    #get 'reenviar-email-cadastro', to: 'devise/confirmations#new'
  end

  root to: "public#index"

  get 'dashboard', to: 'users#dashboard'
  get 'jogos-do-mes', to: 'users#month_games', as: :month_games
  get 'redeem-game-key', to: 'users#redeem_key'
end
