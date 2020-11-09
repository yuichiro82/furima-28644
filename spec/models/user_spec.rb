require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it '全ての値が入力されていれば保存できる事' do
      expect(@user).to be_valid
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = 'a123456'
      @user.password_confirmation = 'a123456'
      expect(@user).to be_valid
    end

    it 'nicknameが空だと保存できない' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空だと保存できない' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが＠を含んでいないと保存できない' do
      @user.email = 'test.test'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end

    it 'すでに登録されているemailは保存できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが空だと保存できない' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'password:半角英数混合(英字のみの場合)でないと登録できない' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'password:半角英数混合(数字のみの場合）でないと登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが5文字以下であれば登録できないこと' do
      @user.password = 'a2345'
      @user.password_confirmation = 'a2345'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'password_confirmationが空だと保存できない' do
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'passwordとpassword_confirmationが不一致では登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '1234567'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'family_nameが空だと保存できない' do
      @user.family_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank", 'Family name is invalid')
    end

    it 'family_nameが漢字・平仮名・カタカナ以外保存できない' do
      @user.family_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name is invalid')
    end

    it 'first_nameが空だと保存できない' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank", 'First name is invalid')
    end

    it 'first_nameが漢字・平仮名・カタカナ以外保存できない' do
      @user.first_name = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end

    it 'family_name_kanaが空だと保存できない' do
      @user.family_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank", 'Family name kana is invalid')
    end

    it 'family_name_kanaが漢字・平仮名・カタカナ以外保存できない' do
      @user.family_name_kana = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kana is invalid')
    end

    it 'first_name_kanaが空だと保存できない' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", 'First name kana is invalid')
    end

    it 'first_nam_kanaeが漢字・平仮名・カタカナ以外保存できない' do
      @user.first_name_kana = '123'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it 'birthdayが空だと保存できない' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
