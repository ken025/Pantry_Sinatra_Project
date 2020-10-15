class ProfileController < ApplicationController

  get '/profile' do 
    @items = Item.all.where(user_id: current_user.id)

    erb :"profile/profile"
  end
end 

#   post '/profile' do 
#   end 
#  end 

# get '/users/:id/edit' do 
#     redirect_if_not_logged_in
#     @user = User.where(user_id: current_user.id)
#     if @user 

#         erb :"profile/edit"
#     else

#         redirect "/profile"
#     end

#   patch '/profile/:id' do 
#     # binding.pry
#     @user = User.find_by_id(params[:id])
#     params.delete("_method")
#     if @user.update(username: params[:username])

#         redirect "/user/#{@user.id}"
#     # else

#     #     redirect "items/new"
#     end
# end 


# end

# #     # anything with '/:id' => looks up a specific item
# # delete '/items/:id' do 
# #     @item = Item.find_by_id(params[:id])
# #      if @user == curent_user.id

# #     # .delete only deletes the object, .destroy deletes de object and asscociated objects
# #          @item.destroy


# #     redirect "/items"
# #  end 
# # end
# # end 
# #  end 