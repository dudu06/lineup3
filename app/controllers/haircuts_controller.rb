class HaircutsController < ApplicationController
	# Get a haircut or tell people you got a haircut 
	respond_to :json

	def index
		@haircut = Haircut.all 
		# @haircut = Haircut.new
		# @customer = Customer.all 
		 # respond_to do |format|
		 	# format.html
		 	# format.json { render json: @haircut }
		 # end
	end

	def show
		@haircut = Haircut.find(params[:id])
	end

	def new
		# @haircut = Haircut.find(params[:haircut_id])
		# @haircut = Haircut.new
		@haircut = Haircut.new
		@customer = Customer.new
    	# @customer = Customer.find(params[:customer_id])
	end

	def create
		 @haircut = Haircut.new(haircut_params)
		 respond_to do |format|
		 	if @haircut.save
		 		format.html { redirect_to :haircuts, notice: "Haircut was made!"}
		 		format.json { render json: @haircut,  notice: "Haircut was made!"}
		 	else
		 		format.html { redirect_to new_haircut_url, notice: "Something fucked up!"}
		 	end
		 end     
    end

		# @barber = Barber.find(params[:barber_id])
		# @haircut = current_user.haircuts.new(haircut_params)
		# @haircut.
		# if @haircut.save
		# 	redirect_to customer_path
		# else
		# 	render 'new'
		# end
	
private
	def haircut_params
		params.require(:haircut).permit(:review, :barber_id, :customer_id, :created_at)
	end


end

# Here is a barber attached to a user's haircut
# user.barber.haircut = @haircut