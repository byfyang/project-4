class SearchController < ApplicationController

	def search
		render :search
	end

	def result
		user_search = params[:search]
		
		result = HTTParty.get "https://api.nutritionix.com/v1_1/search/" + user_search.delete(' ') + "?results=0%3A5&fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat&appId=01023450&appKey=ea3a53123065d780703e44061f281865"


		@result_array = result["hits"]

		





		p @result_array




		# food_result_object = {
		# 	name: result["hits"][0]["fields"]["item_name"],
		# 	calories: result["hits"][0]["fields"]["nf_calories"]
		# }


		# food_result = result["hits"][0]["fields"]["item_name"]



		# p food_result
		# p food_result_object.name
		# p food_result_object.calories



		# p result["hits"][0]["fields"]["item_name"]


		# result_field = result["hits"]
		# @name=result_field["item_name"] 
		# @calories =result_field["nf_calories"]

		render :search
	end


end
