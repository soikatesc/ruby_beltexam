class PurchasesController < ApplicationController
	def create
		product = Product.find(params[:product_id])
		product.status = true
		product.save
		product_p = Product.find(params[:product_id])
		Purchase.create(user: current_user, product: product_p)
		redirect_to '/shoes'
	end
end
