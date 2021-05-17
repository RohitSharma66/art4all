class ArtsController < ApplicationController
	  before_action :set_list, only: [:show, :edit, :update, :destroy]

	def index
		@arts = Art.all
	end

	def show
		# @art = Art.find(params[:id])
		@booking = Booking.new
	end

	def new
		@art = Art.new
	end


	def create
		@art = Art.new(art_params)
		@art.user = current_user
		if @art.save
			redirect_to arts_path
		else
			render 'new'
		end
	end

	def edit
		# @art = Art.find(params[:id])
	end

	def update
		@art = Art.update(art_params)
		if @art.save
			redirect_to art_path(@art)
		end
	end

	def destroy
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
			:rate 
			)
	end
end
