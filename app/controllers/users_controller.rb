class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create 
  		@user = User.new(user_params) 
  		if @user.save 
    		session[:user_id] = @user.id 
    		redirect_to '/' 
  		else 
  			redirect_to '/signup', flash: {notice: 'Unable to Create User.  The Email that you entered is either invalid or already in use.'}

  		end 
	end

  def reset
  end

  def edit
    @users = User.find(params[:id])
  end

  def update
  end


	private
 	def user_params
    	params.require(:user).permit(:id, :first_name, :last_name, :email, :password)
  	end

end
