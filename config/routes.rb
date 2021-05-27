Rails.application.routes.draw do
  # get 'quizzes/index'
  devise_for :users
  root to: 'quizzes#index'

end
