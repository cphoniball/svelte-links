module ValidatesRequests
  private

  def require_valid_token
    token = bearer_token

    if !token = bearer_token
      return respond_unauthenticated(detail: ["Missing authentication token."])
    end

    if !TokenService.valid?(token)
      return respond_unauthenticated(detail: ["Invalid authentication token."])
    end

    @current_user = User.find_for_token(token)
  end

  def bearer_token
    pattern = /^Bearer /
    header = request.headers["Authorization"]
    header.gsub(pattern, "") if header && header.match(pattern)
  end
end
