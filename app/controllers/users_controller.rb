class UsersController < ApplicationController 

  get '/users/:slug' do
    @user = User.find_by(username: params[:slug])
    @reviews = @user.reviews
    erb :'/reviews/mine'
  end
	
end