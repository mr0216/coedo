require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context 'ユーザー登録ができるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、画像、カテゴリー選択、紹介文、URL、営業時間、市町村、番地、建物名、電話番号が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a12345'
        expect(@user).to be_valid
      end
      it 'ユーザーのURLがなくても登録できる' do
        @user.url = ''
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録ができないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'emailに@を含まれていれば登録できない' do
        @user.email = 'abc.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが英数字含まれていなければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード は半角英数字の両方を含めてください')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it '画像が存在していないと保存されない' do
        @user.image = nil
        @user.valid?
        expect(@user.errors.full_messages).to include('画像を入力してください')
      end
      it 'カテゴリーがないと保存されない(id = 1)' do
        @user.category_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Category を選択してください')
      end
      it 'カテゴリーがないと保存されない(id = nil)' do
        @user.category_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include('Category を選択してください')
      end
      it '紹介文がないと保存されない' do
        @user.introduction = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('紹介文を入力してください')
      end
      it '営業時間がないと保存されない' do
        @user.business_hour = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Business hourを入力してください')
      end
      it '住所が空では登録されない' do
        @user.address = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('住所を入力してください')
      end
      it '電話番号が空では登録できない' do
        @user.phone_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Phone numberを入力してください')
      end
      it '電話番号は数字以外は登録されないこと' do
        @user.phone_number = 'あいうえお'
        @user.valid?
        expect(@user.errors.full_messages).to include('Phone numberが無効です')
      end
      it '電話番号は11桁以内であること' do
        @user.phone_number = '090123456789'
        @user.valid?
        expect(@user.errors.full_messages).to include('Phone numberが無効です')
      end
    end
  end
end
