class ApplicationController < ActionController::API
  # TODO: Add rescue_from for missing parameter error
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

  private

  # TODO: Rename these to be respond_*
  def render_success(data:, status: :ok)
    render json: { data: data }, status: status
  end

  def render_error(message:, detail: [], status: :internal_server_error)
    render json: { message: message, detail: detail }, status: status
  end

  def render_not_found
    render json: { message: "Record not found." }, status: :not_found
  end

  def render_unauthenticated(message: "Unauthenticated", detail:)
    render_error(message: message, detail: detail, status: :unauthenticated)
  end


  # TODO: Pull these methods out into a module
  def require_valid_token
    token = bearer_token

    if !token = bearer_token
      return render_unauthenticated(detail: ["Missing authentication token."])
    end

    if !TokenService.valid?(token)
      return render_unauthenticated(detail: ["Invalid authentication token."])
    end

    @current_user = User.find_for_token(token)
  end

  def bearer_token
    pattern = /^Bearer /
    header  = request.headers['Authorization']
    header.gsub(pattern, '') if header && header.match(pattern)
  end
end
