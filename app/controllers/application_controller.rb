require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions, true
    set :session_secret, "thisshouldbeasecret"
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
      @user ||= User.find_by(id: session[:user_id])
    end
  end
end
