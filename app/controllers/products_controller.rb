class ProductsController < ApplicationController
	def index
		@current_user = current_user
		@products = Product.all.where(status:false)
	end

	def dashboard
		@current_user = current_user
		@not_sold = Product.where(user:@current_user).where(status:false)
		@purchases = Purchase.where(user:@current_user)
		# @sold_1 = Product.where(user:@current_user).where(status:true)
		@sold = Product.where.not(user:@current_user).joins(:purchases)

		@purchase_sum = 0
		@purchases.each do |purchase|
			@purchase_sum = @purchase_sum + purchase.product.amount
		end
		# p sum

		@sold_sum = 0
		@sold.each do |product|
			@sold_sum = @sold_sum + product.amount
		end

		p "Total purchase: #{@purchase_sum}"
		p "Total sold: #{@sold_sum}"

	end

	def create
		product = Product.create(product_params.merge(user: current_user, status: 0))

	    if product.valid?
	      redirect_to "/shoes"
	    else
			flash[:errors] = product.errors.full_messages
			redirect_to "/dashboard/#{session[:user_id]}"
		end

	end

	def destroy
		product = Product.find(params[:product_id])
		product.destroy
		redirect_to '/shoes'
	end

	private
	    def product_params
	      params.require(:product).permit(:name, :amount)
	    end
end

