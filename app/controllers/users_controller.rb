class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    render json: user
  end

  def create
    user = User.new(user_params)
    if user.save 
      jwt = self.issue_token(user)
      render json: {user: user, jwt: jwt}
    else
      render json: {error: user.errors, status: :unprocessable_entity}
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: {message: 'User has been deleted'}
    else
      render json: {error: "You're stuck with us!"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :dob, :email, :address, :password)
  end
end
