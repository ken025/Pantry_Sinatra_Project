require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions, true
    set :session_secret, ENV["SECRET"]
    register Sinatra::Flash
  end

  get '/' do 

    erb :welcome
  end 
  

# helper methods to limit user accessibility 
helpers do
  def logged_in?
    session[:user_id]
  end

  def current_user

    # memoization, uses the @user or finds the user's id and sets it to @user
    @current_user ||= User.find_by(id: session[:user_id])
    end

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "You have to be logged in to view this page."
        redirect "/login"
      end
    end
  end
end