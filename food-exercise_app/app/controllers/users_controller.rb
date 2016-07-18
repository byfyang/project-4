class UsersController < ApplicationController
	def user_params
	  params.require(:user).permit(:first_name, :last_name, :gender, :weight, :email, :password, :height, :age)
	end

	###home###
	def home
		render :home
	end

	###user index###
	def index
		@users = User.all
		render :index
	end

	def new
		@user = User.new
		render :new
	end

	def create
	  user_params = params.require(:user).permit(:first_name, :last_name, :email, :password)
	  @user = User.create(user_params)
	  login(@user)

	  redirect_to "/users/#{@user.id}"
	end

	def show
		@user = User.find(params[:id])
		render :show
	end

	def edit
		@user = User.find(params[:id])
		render :edit
	end

	def update
		@user = User.find(params[:id])
		@user.update_attributes(user_params)

		if @user.update_attributes(user_params)
			# flash[:success] = "Updated!"
			redirect_to "/users/#{@user.id}"
		else
			render :edit
		end
	end

end
