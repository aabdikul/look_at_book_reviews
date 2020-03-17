

class BooksController < ApplicationController


	get '/books' do
		if logged_in?
			@books = Book.all
			erb :'/books/books'
		else 
			redirect '/login'
		end
	end

	get '/books/add' do 
		if logged_in? 
		erb :'/books/add'
		else 
			redirect '/login'
		end
	end

	post '/books/add' do 
		if 	Book.find_by(title: params[:title]) == nil
			@book = Book.create(title: params[:title], author: params[:author])
			redirect '/books'
		elsif Book.find_by(title: params[:title]) != nil
			flash[:message] = "This book is already in our database."
			redirect '/books/add'
		end
	end

	get '/books/:slug' do
		if logged_in?
			@book = Book.find_by_slug(params[:slug])
			@reviews = @book.reviews
			erb :'/reviews/show_review'
		else 
			redirect '/login'
		end
	end

end