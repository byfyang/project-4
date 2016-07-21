class UsersController < ApplicationController

	before_action :require_login, :except => [:new, :create, :home]
	# before_action :current_profile?, only:[:edit] 
	def user_params
	  params.require(:user).permit(:first_name, :last_name, :gender, :weight, :email, :password, :height, :age, :image_url, :description)
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
	  user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :image_url)
	  @user = User.create(user_params)
	  login(@user)

	  redirect_to "/users/#{@user.id}"
	end

	def show
		@user = User.find(params[:id])
		@foods = @user.foods
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
