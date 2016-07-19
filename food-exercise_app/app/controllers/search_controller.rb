class SearchController < ApplicationController

	def search
		render :search
	end

	def result
		user_search = params[:search]

		result = HTTParty.get "https://api.nutritionix.com/v1_1/search/" + user_search.to_str.delete(' ') + "?results=0%3A10&fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat&appId=01023450&appKey=ea3a53123065d780703e44061f281865"

		@result_array = result["hits"]
		# p @result_array
		render :search
	end

	def exercise_form
		selected_food = params['food']['search']
		@foodName = selected_food.split('cals').first
		p @foodName
		@foodCal = selected_food.split('cals').last
		p @foodCal

		@time_running = @foodCal.to_f * 4.184 / ((27 * 0.2017) - (150 * 0.09036) + (148 * 0.6309) - 55.0969 )
		p @time

		@time_walking = @foodCal.to_f / 5 / (150 * 0.45392) * 60
		p @time_walking

		@time_swimming = @foodCal.to_f / 9.8 / (150 * 0.45392) * 60
		p @time_swimming

		render :exercise


		# current_user = User.find(params[:id])

		# if current_user.gender = 'male'
		

		# else current_user.gender = 'female'

		# @time = @foodCal * 4.184 / ((current_user.age * 0.074) - (current_user.weight * 0.05741) + (148 * 0.4472) - 20.4022 )

	end

	def food_exercise_save

	end


end
