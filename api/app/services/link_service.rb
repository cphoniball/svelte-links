class LinkService
  def self.all_for_user(user)
    # TODO: Determine if there's a more efficient way to write this query
    Link.where(link_page_id: LinkPageService.all_for_user(user))
  end
end
