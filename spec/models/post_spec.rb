require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿の保存' do
    context "投稿ができるとき" do
      it "title、カテゴリー、テキスト、画像が存在すれば投稿できる" do
        expect(@post).to be_valid
      end
    end
    context '投稿ができないとき' do
      it "titleが空では投稿できない" do
        @post.title = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Titleを入力してください")
      end
      it "カテゴリーが空では投稿できない(id = 1)" do
        @post.category_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include("Categoryを選択してください")
      end
      it "カテゴリーが空では投稿できない(id = nil)" do
        @post.category_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Categoryを選択してください")
      end
      it "画像が空では投稿できない" do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("画像を入力してください")
      end
      it "userが紐づいていないと投稿ができない" do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
