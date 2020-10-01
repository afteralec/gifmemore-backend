class AuthController < ApplicationController
  def create
    user = User.includes(:items).find_by(email: user_params[:email])
    if user && user.authenticate(user_params[:password])
      jwt = self.issue_token(user)
      render json: {user: user, jwt: jwt}, include: [ :items ]
    else
      render json: { error: 'Unable to log in, please try again', status: 401 }
    end
  end

  def show
    user = User.includes(:items).find(self.user_id)
    if user && logged_in?
      render json: {user: user, jwt: self.token}, include: [:items]
    else
      render json: { error: 'User cannot be found', status: 401 }
    end
  end
  

  private
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end