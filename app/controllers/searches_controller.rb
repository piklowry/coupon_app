class SearchesController < ApplicationController
	def index

	end

	def search
			@search_results = Coupon.search(params[:search])
			render results_searches_path 
	end



end
