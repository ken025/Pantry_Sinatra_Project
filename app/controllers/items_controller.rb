class ItemsController < ApplicationController

    # Shows user all of the items
        get '/items' do 
            # binding.pry
            redirect_if_not_logged_in
                @items = Item.all.where(user_id: current_user)

            erb :"items/index"
        end 
    
    # Creates new item
        get '/items/new' do 
            redirect_if_not_logged_in
            @users = User.all

        erb :"items/new"
        end 
    
    # Shows user specific item, by its id number
        get '/items/:id' do 
            #binding.pry
        redirect_if_not_logged_in
            @item = Item.find_by_id(params[:id]) 
    
        erb :"items/show"
    end 
    
    #Posts the new item to the table of items
        post '/items' do
            # binding.pry 
            # item = Item.new(name: params[:name], quantity: params[:quantity]) ==
            item = Item.new(params) #we use 'new' over 'create' to use validations more efficiently
            if item.save

            # if the .save goes through, it will redirect the user to the show page of the particular item
            #if any, requirements have to be met or it will be passed to else
                redirect "items/#{item.id}"
            else 
    
                redirect "items/new"
            end 
        end 
        
        get '/items/:id/edit' do 
            redirect_if_not_logged_in
            @item = Item.find_by_id(params[:id])

                erb :"items/edit"
            end

        # matches form's action
        patch '/items/:id' do 
            # binding.pry
            @item = Item.find_by_id(params[:id])
            params.delete("_method")
            if @item.update(params)

                redirect "/items/#{@item.id}"
            else

                redirect "items/new"
            end
        end 

            # anything with '/:id' => looks up a specific item
        delete '/items/:id' do 
            @item = Item.find_by_id(params[:id])
        #     if user.id == curent_user.id

        #     # .delete only deletes the object, .destroy deletes de object and asscociated objects
                 @item.destroy
        #     else 

            redirect "/items"
        # end 
    end
end 