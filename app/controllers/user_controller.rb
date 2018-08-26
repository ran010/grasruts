class UserController < ApplicationController

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = current_user
    @user.attributes = user_param
    @user.save(context: params[:section].to_sym)
    redirect_back(fallback_location: root_path)
  end

  def show
  end

  def destroy
  end

  private
  def user_param
    params.require(:user).permit(:name, :email, :country, :city, :address, :contact_number, :pan, :facebook, :twitter)
  end
end