class ItemsController < ApplicationController

    # Shows user all of the items
        get '/items' do 
            # binding.pry
            redirect_if_not_logged_in
                @items = Item.all.where(user_id: current_user.id)

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
                id = params[:id]
                @item = Item.find_by_id(id) 
    
            erb :"items/show"
        end 
    
    #Posts the new item to the table of items
        post '/items' do
            item = current_user.items.build(params)
            if item.save
                redirect "/items/#{item.id}"
            else
                redirect "items/new"
            end
        end

        get '/items/:id/edit' do 
            redirect_if_not_logged_in
            @users = User.all
            @item = Item.find_by_id(params[:id])
            if @item.user.id == current_user.id

                erb :"items/edit"
            else

                redirect "/items"
            end
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
             if @user == curent_user.id

            # .delete only deletes the object, .destroy deletes de object and asscociated objects
                 @item.destroy
 

            redirect "/items"
         end 
    end
end 
