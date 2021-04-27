require "rails_helper"

describe Admin::Authenticator do
    describe "#authenticate" do
        example "正しいパスワードならtrueを返す" do
            m = build(:Admin_member)
            expect(Admin::Authenticator.new(m).authenticate("pw")).to be_truthy
        end

        example "誤ったパスワードならfalseを返す" do
            m = build(:Admin_member)
            expect(Admin::Authenticator.new(m).authenticate("xy")).to be_falsey
        end

        example "パスワード未設定ならflaseを返す" do
            m = build(:Admin_member,password:nil)
            expect(Admin::Authenticator.new(m).authenticate(nil)).to be_falsey
        end

        example "停止フラグが立ってもtrueを返す" do
            m = build(:Admin_member,suspended:true)
            expect(Admin::Authenticator.new(m).authenticate("pw")).to be_truthy
        end
    end
end