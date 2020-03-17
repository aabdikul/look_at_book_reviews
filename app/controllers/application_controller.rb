require './config/environment'

class ApplicationController < Sinatra::Base

	configure do
		enable :sessions
		set :session_secret, "secret"
    	set :public_folder, 'public'
    	set :views, 'app/views'
  	end

	get '/' do 
		erb :index
	end

	get '/signup' do 
		if logged_in?
			redirect '/reviews'
		else
			erb :'users/signup'
		end
	end

	post '/signup' do 
		@user = User.create(username: params[:username], email: params[:email], password: params[:password])
		redirect '/login'
	end

	get '/login' do 
		if logged_in?
      		redirect '/reviews'
   		else
    		erb :'/users/login'
    	end
	end

	post '/login' do 
		@user = User.find_by(username: params[:username])
    	if @user && @user.authenticate(params[:password])
    	session[:user_id] = @user.id
    	redirect '/reviews'
    	else 
    	redirect '/signup'
   		end	
    end

    get '/logout' do 
    	session.clear
    	redirect '/login'
    end

	helpers do
    	def logged_in?
      		!!session[:user_id]
    	end

    	def current_user
     		 User.find(session[:user_id])
    	end
  	end

end