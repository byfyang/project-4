class SearchController < ApplicationController

	def search
		render :search
	end

	def result
		user_search = params[:search]
		result = HTTParty.get "https://api.nutritionix.com/v1_1/search/" + user_search.delete(' ') + "?fields=item_name%2Citem_id%2Cbrand_name%2Cnf_calories%2Cnf_total_fat&appId=01023450&appKey=ea3a53123065d780703e44061f281865"

		# p result["hits"][0]["fields"]["item_name"]

		result_field = result["hits"][0]["fields"]
		@name=result_field["item_name"] 
		@calories =result_field["nf_calories"]

		render :search

	end


end
