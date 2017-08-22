class ProductsController < ApplicationController

   def index
      @products=Product.all
   end

   def create
      @user = current_user
      @product = Product.new(item_name: params[:item_name], cost:params[:cost], user: @user)
      unless @product.save
         flash[:errors]=@product.errors.full_messages
      end
      return redirect_to :back
   end

   def destroy
      @product=Product.find(params[:id])

      if @product.user==current_user
         @product.destroy
      end
      return redirect_to :back

   end

end
