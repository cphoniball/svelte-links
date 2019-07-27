class LinkPageService
  def self.all_for_user(user)
    LinkPage.where(user_id: user.id)
  end
end
