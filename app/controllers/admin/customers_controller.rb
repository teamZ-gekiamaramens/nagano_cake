class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
  	@customers = Customer.page(params[:page]).per(10)
  end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
	@customer = Customer.find(params[:id])
		if @customer.update(customer_params)
		   flash[:success] = "会員情報を変更しました"
		   redirect_to admin_customer_path
		else
			render "edit"
		end

	end

	private
	def customer_params
	  params.require(:customer).permit(
	  	:first_name,
	  	:last_name,
	  	:first_name_kana,
	  	:last_name_kana,
	  	:address,
	  	:address_number,
	  	:phone_number,
	  	:email,
	  	:withdrawal)
	end
end

