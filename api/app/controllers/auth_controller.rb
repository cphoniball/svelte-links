class AuthController < ApplicationController
  before_action :require_valid_token

  def me
    respond_success(data: @current_user)
  end
end
