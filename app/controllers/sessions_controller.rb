class SessionsController < ApplicationController

    get '/signup' do
        if logged_in?

        redirect "/items"
        else

        redirect "/signup"
        end
      end

      post '/signup' do
        if 
          @user = User.create(email: params[:email], password: params[:password])
          session[:user_id] = @user.id
          
          redirect "/items"
        else  
          
          redirect "/signup"
        end
      end

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
        
        redirect '/login'
      else
        
        redirect '/'
      end
    end
end