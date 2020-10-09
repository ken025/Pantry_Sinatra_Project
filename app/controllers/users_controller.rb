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
  end 