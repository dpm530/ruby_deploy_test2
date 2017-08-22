class UsersController < ApplicationController

   def index
      @products=Product.where(user: current_user.id)
      @purchased_products=current_user.purchased_products
      @products_for_sale=Product.where.not(id: @purchased_products)
      @money_spent=@purchased_products.sum(:cost)
      @total_cost=@products_for_sale.sum(:cost)
   end

   def create
      @user=User.new(user_params)

      if @user.save

         flash[:notice]=["Registered Successfully"]

         session[:user_id]=@user.id

         return redirect_to products_path

      end

      flash[:errors]=@user.errors.full_messages

      return redirect_to :back
   end

   private
      def user_params
         params.require(:user).permit(:first_name, :last_name, :email, :password)
      end


end
