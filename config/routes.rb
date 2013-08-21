PetitionApp::Application.routes.draw do
  devise_for :users
  devise_for :views

  root :to => 'devise/sessions#new'
end
