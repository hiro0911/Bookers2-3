class UsersController < ApplicationController
	def index
		@users = User.all
		@user = current_user
	end

	def show
		@user = User.find(params[:id])
		@books = Book.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user)
		else
			render "edit"
		end
	end

	def user_params
	  params.require(:user).permit(:name, :introduction, :profile_image)
	end

end
