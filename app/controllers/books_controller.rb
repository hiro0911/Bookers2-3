class BooksController < ApplicationController
	
	def index
	end

	def show
	end

	def edit
	end

	def update
	end

	def new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = current_user.id
		if @book.save
			redirect_to book_path(@book)
		else
			render books_path
		end
	end

	def destroy
	end

	def book_params
		params.require(:book).permit(:title, :body, :user_id)
	end
end
