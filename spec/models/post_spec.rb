require 'rails_helper'

RSpec.describe Post, type: :model do
  context "When creating" do
    context "With wrong attributes" do
      it "Should not save without body" do
        post = FactoryGirl.build(:post, body:'')
        post.save
        expect(Post.count).to_not eq 1
      end

      it "Should not save without author" do
        post=FactoryGirl.build(:post, author:nil)
        post.save
        expect(Post.count).to_not eq 1
      end
    end
  end
end
