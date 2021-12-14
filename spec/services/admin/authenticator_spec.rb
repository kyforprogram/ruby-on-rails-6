require "rails_helper"

describe Admin::Authenticator do
  describe "#authenticate" do
    example "正しいパスワードならtrueを返す" do
      a = build(:administrator)
      expect(Admin::Authenticator.new(a).authenticate("pw")).to be_truthy
    end
  end
end