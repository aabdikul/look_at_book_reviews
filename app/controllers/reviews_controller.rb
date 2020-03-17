class ReviewsController < ApplicationController

	get '/reviews' do 
		if logged_in?
			@reviews = Review.all
			@books = Book.all
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
		@review = Review.create(summary: params[:review])
		@user = User.find_by(id: session[:user_id])
		@book = Book.find_by(id: params[:book_id])
		@user.reviews << @review
		@book.reviews << @review
		redirect '/reviews'
	end

end