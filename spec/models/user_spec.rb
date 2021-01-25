require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録ができるとき" do
    it "nicknameとemailとpasswordとpassword_conrirmationとfirst_nameとlast_nameとfirst_name_kanaとlast_name_kanaとbirth_dateがあれば登録できる" do
    expect(@user).to be_valid
    
    end
    it "passwordとpassword_confirmationが英数字が混ざりかつ6文字以上であれば登録できる" do
      @user.password = "999999a"
      expect(@user).to be_valid
    end
  end
    context "新規登録ができないとき" do
    
    it "nicknameが空では登録できない"do
    @user.nickname = ""
    @user.valid?
    expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password = "99999a"
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it "first_nameが空では登録できない" do
      @user.first_name =""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it "first_name_kanaが空では登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it "last_name_kanaが空では登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it "birth_dateが空では登録できない" do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end
    it "passwordが5文字以下の場合登録できない" do
      @user.password = "99999"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it "passewordが6文字以上だけど英数字が混合していない" do
      @user.password = "999999"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it "first_nameが全角カタカナ、全角ひらがな、全角漢字でないと登録できない" do
    @user.first_name = "kawai"
    @user.valid?
    expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it "last_nameが全角カタカナ、全角ひらがな、全角漢字でないと登録できない" do
    @user.last_name = "atsushi"
    @user.valid?
    expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it "first_name_kanaが全角カタカナでないと登録できない" do
      @user.first_name_kana = "かわい"
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
    it "last_name_kanaが全角カタカナでないと登録できない" do
      @user.last_name_kana = "あつし"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana is invalid"
    end
    it "emailは、@を含む必要があること" do
      @user.email = 12345
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
    it "passewordが半角英語のみ(6桁)では登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
    it "全角英数混合(6桁)は登録できない" do
      @user.password = "ａｄＡＤ１２"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is invalid"
    end
  

  end    
end
end
