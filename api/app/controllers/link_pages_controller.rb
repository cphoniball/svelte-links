class LinkPagesController < ApplicationController
  before_action :require_valid_token

  # TODO: Limit all these actions to return/set data only for link pages tied to the current user
  # TODO: Update methods to use respond_ methods

  def index
    respond_success(data: LinkPageService.all_for_user(@current_user))
  end

  def show
    respond_success(data: LinkPage.find(params[:id]))
  end

  def create
    # create_params[:user_id] = @current_user.id TODO: Do we still need this?
    if @link_page = LinkPage.create(link_page_params)
      respond_created(data: @link_page)
    else
      respond_error(message: "Unable to create link page")
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
