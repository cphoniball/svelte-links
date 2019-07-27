class LinksController < ApplicationController
  before_action :require_valid_token
  # TODO: Get an actual authentication framework so we're not hand-rolling the authentication/permissions here

  def index
    links = LinkService.all_for_user(@current_user)

    if (params[:link_page_id])
      # TODO: Does this fit into the nested resource pattern?
      links = links.where(link_page_id: params[:link_page_id])
    end

    respond_success(data: links)
  end

  def get
    # TODO: Limit this to links that the user owns
    respond_success(data: LinkService.find(params[:id]))
  end

  def create
    # TODO: Ensure user owns link page they are trying to attach to here
    if link = Link.create(link_params)
      respond_success(data: link)
    else
      respond_error(message: "Unable to create link", detail: link.errors)
    end
  end

  def update
  end

  def destroy
  end

  private

  def link_params
    params.require(:title)
    params.require(:url)
    params.require(:link_page_id)
    params.permit(:title, :url, :link_page_id)
  end
end
