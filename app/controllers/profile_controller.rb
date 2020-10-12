class ProfileController < ApplicationController

  get '/profile' do 
    @items = Item.all.where(user_id: current_user.id)

    erb :"profile/profile"
  end

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
end 