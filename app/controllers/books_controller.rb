class BooksController < ApplicationController

	get '/books' do
		@books = Book.all
		erb :'/books/books'
	end

	get '/books/add' do 
		erb :'/books/add'
	end

	post '/books/add' do 
		@book = Book.create(title: params[:title], author: params[:author])
		redirect '/books'
	end

	get '/books/:slug'
		@book = Book.find_by_slug(params[:slug])
	end

end