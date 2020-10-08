class SessionsController < ApplicationController

    get '/login' do

        erb :"sessions/login"
    end

    post '/login' do
        #binding.pry
        #finds the user
        user = User.find_by(email: params[:email])

        #authenticates the user (from decrypt gem)
        if user && user.authenticate(params[:password])

        # logs the user in and redirect
            session[:user_id] = user.id

            redirect "/items"
        else

            redirect "/login"
        end
    end

    get '/logout' do
      if logged_in?
        session.clear
        
        redirect '/welcome'
      else
        
        redirect '/'
      end
    end
end