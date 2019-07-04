require "rails_helper"

RSpec.describe LinkPage, type: :model do
  before do
    @link_page = create(:link_page)
  end

  it "has a name" do
    expect(@link_page.name).to include("Test Link Page")
  end

  it "belongs to a user" do
    expect(@link_page.user.username).to include("Chris")
  end
end
