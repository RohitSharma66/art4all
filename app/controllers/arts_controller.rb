class ArtsController < ApplicationController
	  before_action :set_list, only: [:show, :edit, :update]

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
			redirect_to art_path(@art)
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


	private

	 def set_list
    	@art = Art.find(params[:id])
  	end

	def art_params
		params.require(:art).permit(
			:name, 
			:artist,
			:photos, 
			:price, 
			:type, 
			:medium, 
			:style, 
			:year, 
			:size, 
			:ready_to_hang, 
			:frame, 
			:materials, 
			:shipping
			)
	end

end
