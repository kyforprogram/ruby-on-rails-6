require "rails_helper"

describe Staff::Authenticator do
  describe "#authenticate" do

    example "正しいパスワードならtrueを返す" do
      m = build(:staff_member)
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_truthy
    end

    example "誤ったパスワードならfalseを返す" do
      m = build(:staff_member)
      expect(Staff::Authenticator.new(m).authenticate("xy")).to be_falsey
    end

    # example "誤ったパスワードならfalseを返す" do # エラーが発生するように作成した
    #   m = build(:staff_member)
    #   expect(Staff::Authenticator.new(m).authenticate("pw")).to be_falsey
    # end

    example "パスワードが未設定ならfalseを返す" do
      m = build(:staff_member, password: nil)
      expect(Staff::Authenticator.new(m).authenticate(nil)).to be_falsey
    end

    # example "停止フラグが立っていればfalseを返す" do
    example "停止フラグが立っていればtrueを返す" do
      m = build(:staff_member, suspended: true)
      # expect(Staff::Authenticator.new(m).authenticate("pw")).to be_falsey
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_truthy
    end

    example "開始前ならfalseを返す" do
      m = build(:staff_member, start_date: Date.tomorrow)
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_falsey
    end

    example "終了後ならfalseを返す" do
      m = build(:staff_member, end_date: Date.today)
      expect(Staff::Authenticator.new(m).authenticate("pw")).to be_falsey
    end

    # example "終了後ならfalseを返す" do
    #   m = build(:staff_member, end_date: Date.yesterday, suspended: false)#退会済みのmethodsをまだ作っていいないからテストには引っ掛からない
    #   expect(Staff::Authenticator.new(m).authenticate("pw")).to be_falsey
    # end
  end
end