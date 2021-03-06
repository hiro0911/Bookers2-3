class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
		@users = User.all
		@user = current_user
		@book = Book.new
	end

	def show
		@book = Book.new
		@user = User.find(params[:id])
		@books = Book.all
	end

	def edit
		@user = User.find(params[:id])
		@book = Book.new
		if @user != current_user
			redirect_to user_path(current_user)
		end
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user), notice: "successfully"
		else
			flash[:notice] = "error"
			render "edit"
		end
	end

	def user_params
	  params.require(:user).permit(:name, :introduction, :profile_image)
	end

end
