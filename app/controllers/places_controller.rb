class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]

	def index
		# @places = Place.all
		@places = Place.order(:id).page params[:page]
	end

	def new
		@place = Place.new
	end

	def create
		current_user.places.create(place_params)
		redirect_to root_path
	end

	private

	def place_params
		params.require(:place).permit(:name, :description, :address)
	end
end

class Place < ActiveRecord::Base
	paginates_per 10
end

