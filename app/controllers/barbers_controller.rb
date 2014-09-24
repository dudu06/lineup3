class BarbersController < ApplicationController

# respond_to :json
# def index 
# 	@barber_array = @barbers.all.map { |f|
#         { id: f.barber_id, name: f.barber_first_name, image: f.image} }.to_json
  
#     respond_to do |format|
#     format.html
#     format.js	
# end

	def index
		@barbers = Barber.all 
	
	end

	def new
		@barbers = Barber.new
	end

	def create 
		@barber = Barber.new(barber_params)
		if @barber.save
			session[:barber_id] = @barber_id.to_s
			redirect_to new_session_path
		else
			render 'new'
		end
	end

	def show
		@barber = Barber.find(params[:id])
		# binding.pry
	end

	def edit
		@barber = Barber.find(params[:id])
	end

	def update
		@barber = Barber.find(params[:id])
		if @barber.update_attributes(barber_params)
	  	redirect_to barber_path
		else
	    render 'edit'
		end
	end

	def barber_params
		params.require(:barber).permit(:first_name, :last_name, :email, :avatar, :password, :password_confirmation, :low_price, :high_price, :sex, :address, :barbertype)
	end

end
