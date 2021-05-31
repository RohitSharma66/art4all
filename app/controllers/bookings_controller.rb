class BookingsController < ApplicationController

	def index
		@arts = policy_scope(Booking).order(created_at: :desc)
		@bookings = Booking.where(user_id: current_user)
		# authorize @booking
		owner_arts = current_user.arts
		@owner_bookings = owner_arts.map(&:bookings).flatten
	end

	def show
		@booking = Booking.find(params[:id])
		@art = Art.find(params[:art_id])
		@total_price = @art.rate * (@booking.end_date.mjd - @booking.start_date.mjd)
		authorize @booking
	end

	def create
		@booking = Booking.new(booking_params)
		@art = Art.find(params[:art_id])
		authorize @booking
		@booking.user = current_user
		@booking.art = @art
		if @booking.save
			redirect_to bookings_path
		else
			render 'new'
		end
	end

	def edit
		@booking = Booking.find(params[:id])
		@art = Art.find(params[:art_id])
		authorize @booking
	end

	def update
		@booking = Booking.find(params[:id])
		@art = Art.find(params[:art_id])
		authorize @booking
		@booking.art = @art
		if @booking.update(booking_params)
			redirect_to bookings_path
		else
			render 'edit'
		end
	end

	def destroy
		@booking = Booking.find(params[:id])
		@booking.destroy
		redirect_to bookings_path
		authorize @booking
	end

	private

	def booking_params
		params.require(:booking).permit(:start_date, :end_date, :approved)
	end

end
