PetitionApp::Application.routes.draw do
  devise_for :views

  root :to => 'home#index' #change later
end
