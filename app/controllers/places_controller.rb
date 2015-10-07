class PlacesController < ApplicationController
	def index
		# @places = Place.all
		@places = Place.order(:id).page params[:page]
	end
end

class Place < ActiveRecord::Base
	paginates_per 10
end
