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
          flash[:alert] = "Sorry, the email and/or password you entered was incorrect. Please try again."
            redirect "/login"
        end
    end

    get '/logout' do
      if logged_in?
        session.clear
        
        erb :'/welcome'
      else
        
        redirect '/'
      end
    end
end