class AuthController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    
    if user && user.authenticate(params[:password])
      token = self.issue_token(user)
      render json: { email: user.email, id: user.id, jwt: token }
    else
      render json: { error: 'Unable to log in', status: 401 }
    end
  end

  def show
    user = User.find(self.user_id)

    if user && logged_in?
      render json: { email: user.email, id: user.id, jwt: self.token}
    else
      render json: { error: 'User cannot be found', status: 401 }
    end
  end
end
