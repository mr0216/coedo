require 'rails_helper'

RSpec.describe '新規投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post)
  end

  context '投稿に失敗したとき' do
    it '送る値が空の為、メッセージの送信に失敗すること' do
      # サインインする
      sign_in(@user)

      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規投稿')

      # 新規登録ページへ移動する
      visit new_post_path

      # DBに保存されていないことを確認する
      expect do
        find('input[name="commit"]').click
      end.not_to change { Post.count }

      # 元のページに戻ってくることを確認する
      expect(current_path).to eq '/posts/new'
    end
  end

  context '投稿ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができてトップページに移動する' do
      # サインインする
      sign_in(@user)

      # トップページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('新規投稿')

      # 新規登録ページへ移動する
      visit new_post_path

      # 値をテキストフォームに入力する
      fill_in 'post[title]', with: @post.title
      select  '観光地', from: 'post[category_id]'
      fill_in 'post[text]', with: @post.text
      attach_file('post[image]', image_path, make_visible: true)

      # 送信した値がDBに保存されていることを確認する
      expect do
        find('input[name="commit"]').click
      end.to change { Message.count }.by(1)

      # 投稿一覧画面に遷移していることを確認する
      expect(current_path).to eq root_path

      # 送信した画像がブラウザに表示されていることを確認する
      expect(page).to have_selector('img')
    end
  end
end
