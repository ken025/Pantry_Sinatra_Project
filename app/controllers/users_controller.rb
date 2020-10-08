class UsersController < ApplicationController 

    get '/users/signup' do
        erb :"users/signup"
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

    post '/users' do
        #create user
        @user = User.new(params)
        # save
        if @user && @user.save
        # if it saves
            session[:user_id] = @user.id
            # set session ID
            redirect "/posts"
            # redirect the user
        else
        # if it doesn't save
        binding.pry
            erb :"users/signup"
            #redirect back to signup
        end
    end

end 