require "rails_helper"

RSpec.describe User, type: :model do
  before do
    @user = create(:user)
  end

  describe "#token" do
    it "should generate a valid JWT token with the user payload" do
      token = @user.token
      expect(token).to be_instance_of(String)
      expect(TokenService.valid?(token)).to be_truthy
    end
  end

  describe "#token_valid?" do
    it "returns true when the token is valid and for the calling user" do
      token = @user.token
      expect(@user.token_valid?(token)).to be_truthy
    end

    it "returns false when the token is invalid or not for the calling user" do
      another_user_token = create(:user).token
      expect(@user.token_valid?(another_user_token)).to be_falsey
      expect(@user.token_valid?("not a token")).to be_falsey
    end
  end
end
