class BookingsController < ApplicationController

	def index
		@bookings = Booking.where(user_id: current_user)
		owner_arts = current_user.arts
		@owner_bookings = owner_arts.map(&:bookings).flatten
	end

	def show
		@booking = Booking.find(params[:id])
		@art = Art.find(params[:art_id])
		@total_price = @art.price * (@booking.end_date.mjd - @booking.start_date.mjd)
	end

	def create
		@booking = Booking.new(booking_params)
		@art = Art.find(params[:art_id])
		@booking.user = current_user
		@booking.art = @art
		if @booking.save
			redirect_to art_booking_path(@art, @booking)
		else
			render 'new'
		end
	end

	def edit
		@booking = Booking.find(params[:id])
		@art = Art.find(params[:art_id])
	end

	def update
		@booking = Booking.find(params[:id])
		@art = Art.find(params[:art_id])
		@booking.art = @art
		if @booking.update(booking_params)
			redirect_to art_booking_path(@art, @booking)
		else
			render 'edit'
		end
	end

	def destroy
		@booking = Booking.find(params[:id])
		@booking.destroy
		redirect_to bookings_path
	end

	private

	def booking_params
		params.require(:booking).permit(:start_date, :end_date, :approved)
	end

end
