class ApplicationController < ActionController::API
  include ValidatesRequests

  # TODO: Add rescue_from for missing parameter error
  rescue_from ActiveRecord::RecordNotFound, with: :respond_not_found

  private

  def respond_success(data:, status: :ok)
    render json: { data: data }, status: status
  end

  def respond_error(message:, detail: [], status: :internal_server_error)
    render json: { message: message, detail: detail }, status: status
  end

  def respond_not_found
    render json: { message: "Record not found." }, status: :not_found
  end

  def respond_unauthenticated(message: "Unauthenticated", detail:)
    respond_error(message: message, detail: detail, status: :unauthenticated)
  end
end
