class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def get
    render json: User.find(params[:id])
  end

  def create
    if user = User.create(user_params)
      render json: user, status: :created
    else
      render json: { message: "Unable to create user." }, status: :internal_server_error
    end
  end

  def update
  end

  def destroy
  end

  private

  def user_params
    params.require(:username)
    params.require(:email)
    params.permit(:username, :email)
  end
end
