class CustomersController < ApplicationController

	def index 
	end


	def new
		@customers = Customer.new
	end

	def create 
		@customer = Customer.new(customer_params)
		if @customer.save
			session[:customer_id] = @customer_id.to_s
			redirect_to new_session_path
		else
			redirect_to new_customer_path
		end
	end

	def show
		@customer = Customer.find(params[:id])
		@barbers = Barber.all
		@barbers = Barber.where(params[:zipcode])
		# @pictures = Picture.all

		# users = User.where(name: 'David', occupation: 'Code Artist').order('created_at DESC')
	end

	def edit
		@customer = Customer.find(params[:id])
		# @picture = @customer.pictures.find(params[:id])
	end

	def update
		# @picture = @customer.picture.find(params[:id])
    	@customer = Customer.find(params[:id])
    	if @customer.update_attributes(customer_params)
      	redirect_to customers_path
    	else
        render 'edit'
    	end
    end

	 def customer_params
	    params.require(:customer).permit(:first_name, :last_name, :email, :avatar, :picture, :password, :password_confirmation, :customertype)
	 end


end


