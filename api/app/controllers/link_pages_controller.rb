class LinkPagesController < ApplicationController
  def index
    render json: LinkPage.all
  end

  def get
    render json: LinkPage.find(params[:id])
  end

  def create
    if @link_page = LinkPage.create(link_page_params)
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
    params.permit(:name, :user_id)
  end
end
