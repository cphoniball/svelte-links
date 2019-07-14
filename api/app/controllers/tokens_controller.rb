class TokensController < ApplicationController
  def create
    params.require([:username, :password])

    username = params[:username]
    user = User.find_by!(username: params[:username])

    if user.authenticate(params[:password])
      respond_success(data: user.token, status: :created)
    else
      respond_error(message: "Invalid credentials", status: :unauthorized)
    end
  end

  def destroy
  end
end
