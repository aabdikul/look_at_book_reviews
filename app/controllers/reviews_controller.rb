

class ReviewsController < ApplicationController


	get '/reviews' do 
		if logged_in?
			@reviews = Review.all
			@books = Book.all
			@user = User.find_by(id: session[:user_id])
			erb :'/reviews/reviews'
		else 
			redirect '/login'
		end
	end

	get '/reviews/new' do 
		@books = Book.all
		if logged_in?
			@session = session
			erb :'/reviews/new'
		else 
			redirect '/login'
		end
	end

	post '/reviews/new' do 
		if params[:review] != ""
			@review = Review.create(summary: params[:review])
			@user = User.find_by(id: session[:user_id])
			@book = Book.find_by(id: params[:book_id])
			@user.reviews << @review
			@book.reviews << @review
			redirect '/reviews'
		else
			flash[:message] = "Please do not submit a blank review!"
			redirect '/reviews/new'
		end
	end

	get '/reviews/new/:slug' do 
		if logged_in?
			@book = Book.find_by_slug(params[:slug])
			@reviews = @book.reviews
			erb :'/reviews/show_review'
		else 
			redirect '/login'
		end
	end

	get '/reviews/:id' do 
		@review = Review.find_by(id: params[:id])
		@user = User.find_by(id: session[:user_id])
    	if logged_in?
     		 erb :'/reviews/single'
    	else
    		  redirect '/login'
    	end
  	end


	get '/reviews/:id/edit' do 
		if logged_in?
			@review = Review.find_by(id: params[:id])
			@user = User.find_by(id: session[:user_id])
			if @user == @review.user
			erb :'/reviews/edit'
			else 
				redirect '/reviews'
			end
		else 
			redirect '/login'
		end
	end

	patch '/reviews/:id' do 
		@review = Review.find_by(id: params[:id])
   		@review.update(summary: params[:summary])
    	redirect "/reviews/#{@review.id}"
	end

	delete '/reviews/:id' do 
		@review = Review.find_by(id: params[:id])
		@review.destroy
		redirect '/reviews'
	end

end
