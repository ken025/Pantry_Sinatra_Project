class UsersController < ApplicationController 

get '/signup' do
    redirect_if_logged_in
    erb :'users/signup'
  end

  # CREATE -- accept sign up params and create a user
  post "/signup" do
    @user = User.find_by(username: params[:username])
    if @user
      flash[:alert] = "This username has been taken."

      redirect "/signup"
    else

      @user = User.new(email: params[:email], username: params[:username], password: params[:password])
      if @user.save
        session[:user_id] = @user.id
        redirect "/items"

      else

        redirect "/signup"
      end 
    end
  end 
    
    get '/login' do

      erb :"users/login"
  end

  post '/login' do
      #binding.pry
      #finds the user
      user = User.find_by(username: params[:username])

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