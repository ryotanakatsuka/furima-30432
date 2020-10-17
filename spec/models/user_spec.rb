require 'rails_helper'
RSpec.describe User, type: :model  do
      before do
        @user = FactoryBot.build(:user)
      end
 
    describe "ユーザー新規登録" do
      context "新規登録がうまく行く時" do
        it "nickname,email,password,password_confirmation,first_name,last_name,first_name_kana,last_name_kana,birth_dayが存在すれば登録できる" do
          expect(@user).to be_valid
        end
        it "emailに@があると登録できる" do
          @user.email="kkk@gmail.com"
          expect(@user).to be_valid
        end
        it "passwordが6文字以上で登録できる" do
          @user.password ="n000000"
          expect(@user).to be_valid
        end
        it "passwordとpassword_confirmationが一致すると登録できる" do
          @user.password ="n000000"
          @user.password_confirmation="n000000"
          expect(@user).to be_valid
        end
      end
      context "新規登録ができない時" do
        it "nicknameが空だと登録できない" do
          @user.nickname=""
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")

        end
        it "emailが空だと登録できない"do
          @user.email=""
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "emailに@がないと登録できない"do
          @user.email="kkkgmail.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "passwordが空だと登録できない"do
          @user.password =""
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "passwordが５文字以下では登録できない"do
          @user.password ="00000"
          @user.password_confirmation ="00000"
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "passwordとpassword_confirmationが一致しないならば登録できない" do
        @user.password = "n000000"
        @user.password_confirmation = "a123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
    end
end
