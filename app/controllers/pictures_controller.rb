class PicturesController < ApplicationController

	def index
		@barber = Barber.find(params[:barber_id])
		@pictures = Picture.where(barber_id: @barber.id)
		#This method will find a barber. 
		#When that barber is found, it will find the Pictures in the pictures table
		#that are associated with the barber id in that table and the barber id in the barber object
		#This page is at the barbers/id/pictures 
	end


	def new
		if current_user.customertype == "Customer"
			@customer = Customer.find(params[:customer_id])
			@picture = Picture.new
			# @barber = Barber.find(params[:id])
			# @picture = Picture.new
		else

			@barber = Barber.find(params[:barber_id])
			@picture = Picture.new
		end
	end
	
	def create
		# The customertype method will set our current user to a customer!
		if current_user.customertype == "Customer"
		customer = Customer.find_by(params[:id])
		# After the customer's id is found, that particular customer's id will be set for the new picture
		@picture = customer.pictures.new(picture_params)
		
		if @picture.save
			redirect_to customer__path
		else 
			render 'new'
		end

	 	else 
		
		@barber = Barber.find(params[:barber_id])
		@picture = @barber.pictures.new(picture_params)
		
		if @picture.save
			redirect_to barber_picture_path(@barber, @picture)
		else 
			render 'new'
		end
		end

		# @barber = Barber.find(params[:id])
	
		# @picture = Picture.where(@current_user => @barber || @customer)
		# @picture = Picture.new(params.require(:picture)).permit(:barber_id, :join_picture_id :customer_id)
		# if @current_user == @barber && @barber.picture.create!
		# 	:customer_id == nil 
		# else @current_user == @customer.where(:join_picture_id => @current_user)
		# @picture.customer = current_user
		# if @picture.save
		#    redirect_to customer_path
		# else
		#   render 'new'
		# end
  	end

 #  	def create 
	# 	@customer = Customer.where(email: params[:session][:email]).first
	# 	#Let's find a user
	# 	@barber = Barber.where(email: params[:session][:email]).first
	# 	#if customer authenticates
	# 	if @customer && @customer.authenticate(params[:session][:password])
	# 		#This should set a cookie to the customer's browser
	# 		session[:customer_id] = @customer.id.to_s
	# 		redirect_to customer_path(@customer)
	# 	elsif
	# 		@barber && @barber.authenticate(params[:session][:password])
	# 		session[:barber_id] = @barber.id.to_s
	# 		redirect_to barber_path(@barber)
	# 	else
	# 		redirect_to 'https://www.facebook.com/'
	# 	end
	# end

	def show
		@pictures = Picture.all 
		if current_user.customertype == "Customer"
			@customer = Customer.find_by(params[:id])
			@picture = @customer.pictures.find(params[:id])
		else
			@barber = Barber.find(params[:barber_id])
			@picture = @barber.pictures.find(params[:id])
		end
	end

	def picture_params
		params.require(:picture).permit( :picture_name, :customer_id, :barber_id)
	end


end









# class JoinPicturesController < ApplicationController
#   def index
#   end

#   def new
#   	@join = JoinPicture.new(join_params)
#   end

#   def create
#   	@join = JoinPicture.new(join_params)
#   	if @join.save
#   		redirect_to customers_path 
#   	else render 'edit'
#   end

#   def destroy
#   end

#   private

#   def joinparams
#   	join_params = params.require(joinparams).permit(:picture_id, :barber_id, :customer_id)
#   end

# end
