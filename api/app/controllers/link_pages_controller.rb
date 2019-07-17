class LinkPagesController < ApplicationController
  before_action :require_valid_token

  # TODO: Limit all these actions to return/set data only for link pages tied to the current user
  # TODO: Update methods to use respond_ methods

  def index
    respond_success(data: LinkPage.where(user_id: @current_user.id))
  end

  def get
    respond_success(data: LinkPage.find(params[:id]))
  end

  def create
    create_params = link_page_params
    create_params[:user_id] = @current_user.id
    if @link_page = LinkPage.create(create_params)
      render json: @link_page, status: :created
    else
      render json: { message: "Unable to create link page." }, status: :internal_server_error
    end
  end

  def update
  end

  def destroy
  end

  private

  def link_page_params
    params.require(:name)
    params.permit(:name).merge(user_id: @current_user.id)
  end
end
