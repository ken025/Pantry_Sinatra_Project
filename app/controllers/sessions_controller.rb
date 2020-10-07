class SessionsController < ApplicationController

    get '/signup' do
        if logged_in?

        redirect to "/items"
        else

        erb :"sesions/signup"
        end
      end

      post '/signup' do
        if 
          @user = User.create(email: params[:email], password: params[:password])
          session[:user_id] = @user.id
          
          redirect to '/items'
        else  
          
          redirect to '/signup'
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
end