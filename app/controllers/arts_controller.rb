class ArtsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index, :show]
	before_action :set_list, only: [:show, :edit, :update, :destroy]
	  

	def index
		@arts = policy_scope(Art).order(created_at: :desc)
		@arts = Art.all
		@arts = Art.where.not(latitude: nil, longitude: nil)
		@markers = @arts.geocoded.map do |art|
	      {
	        lat: art.latitude,
	        lng: art.longitude
	      }
	    end
  	end

	def show
		# @art = Art.find(params[:id])
		@booking = Booking.new
		authorize @art
	end

	def new
		@art = Art.new
		authorize @art
	end


	def create
		@art = Art.new(art_params)
		authorize @art
		@art.user = current_user
		if @art.save
			redirect_to art_path(@art)
		else
			render 'new'
		end
	end

	def edit
		authorize @art
		# @art = Art.find(params[:id])
	end

	def update
		# @art = Art.update(art_params)
		authorize @art
		if @art.update(art_params)
			redirect_to arts_path
		else
			render 'edit'
		end
	end

	def destroy
		authorize @art
		@art.destroy
		redirect_to arts_path
	end


	private

	def set_list
    	@art = Art.find(params[:id])
  	end

	def art_params
		params.require(:art).permit(
			:name, 
			:artist,
			:photo, 
			:price,
			:rate, 
			:style,
			:owner,
			:address 
			)
	end
end
