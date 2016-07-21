class FoodsController < ApplicationController

	before_action :require_login
	
	def search_page
		render :search_page
	end

	###API usage###
	def search_result
		user_search = params[:search]

		result = HTTParty.get "https://api.nutritionix.com/v1_1/search/" + user_search.to_str.delete(' ') + "?results=0%3A10&fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat&appId=01023450&appKey=ea3a53123065d780703e44061f281865"

		@result_array = result["hits"]
		# p @result_array
		render :search_page
	end

	###pass selected food params and calculate time needed to burn calories###
	def calculate_calories
		selected_food = params['food']['search']
		foodName = selected_food.split('cals').first
		@name = foodName
		foodCal = selected_food.split('cals').last
		@calories = foodCal

		###distinguish between female/male###
		if current_user.gender = 'male'
		@time_running = foodCal.to_f * 4.184 / ( (current_user.age * 0.2017) - (current_user.weight * 0.09036) + (148 * 0.6309) - 55.0969 )
		
		@time_walking = foodCal.to_f / 5 / (current_user.weight * 0.45392) * 60
		
		@time_swimming = foodCal.to_f / 9.8 / (current_user.weight * 0.45392) * 60

		@time_programming = foodCal.to_f / 1.8 / (current_user.weight * 0.45392) * 60
		
			elsif current_user.gender ='female'
				@time_running = foodCal.to_f * 4.184 / ( (current_user.age * 0.074) - (current_user.weight * 0.05741) + (148 * 0.4472) - 20.4022 )
				
				@time_walking = foodCal.to_f / 5 / (current_user.weight * 0.45392) * 60
				
				@time_swimming = foodCal.to_f / 9.8 / (current_user.weight * 0.45392) * 60

				@time_programming = foodCal.to_f / 1.8 / (current_user.weight * 0.45392) * 60
			end
		render :exercise
	end

	###create food and associate with user###
	def create
		 food_params = params.require(:food).permit(:name, :exercise, :calories, :time)
		 food = Food.create(food_params)
		 current_user.foods << food
		 if food.save
		 	redirect_to "/users/#{current_user.id}"
		 end
	end

	###delete user added food###
	def destroy
		@food = Food.find(params[:id])
		@food.destroy
		redirect_to "/users/#{current_user.id}"
	end

end
