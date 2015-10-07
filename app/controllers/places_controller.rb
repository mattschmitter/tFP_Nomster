class PlacesController < ApplicationController
	def index
		# @places = Place.all
		@places = Place.order(:name).page params[:page]
	end
end

class Place < ActiveRecord::Base
	paginates_per 10
end
