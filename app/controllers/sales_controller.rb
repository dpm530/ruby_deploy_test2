class SalesController < ApplicationController

   def create
      @product=Product.find(params[:id])
      Sale.create(user: current_user, product: @product) unless @product.users.include?(current_user)

      return redirect_to users_path
   end

end
