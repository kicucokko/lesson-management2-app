require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全て入力されていれば新規登録ができる' do
        expect(@user).to be_valid
      end
      it 'stationが空でも登録できる'do
        @user.station = ""
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'emailがなければ登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailを入力してください")
      end
      it 'emailに＠が入っていなければ登録できない' do
        @user.email = "yyyytest.co.jp"
        @user.valid?
        expect(@user.errors.full_messages).to include("Emailは不正な値です")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        current_user = FactoryBot.build(:user)
        current_user.email = @user.email
        current_user.valid?
        expect(current_user.errors.full_messages).to include("Emailはすでに存在します")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Passwordを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = "4y4y4y4y"
        @user.password_confirmation = "3t3t3t3t"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "5t5t5"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmationとPasswordの入力が一致しません" ,"Passwordは6文字以上で入力してください")
      end
      it 'roleがなければ登録できない' do
        @user.role = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Roleを入力してください")
      end
      it 'nicknameがなければ登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nicknameを入力してください")
      end
      it 'nameがなければ登録できない' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nameを入力してください")
      end
      it 'name_kanaがなければ登録できない' do
        @user.name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanaを入力してください")
      end
      it 'name_kanaはアルファベットでは登録できない' do
        @user.name_kana = "abc"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanaは全角カタカナで入力してください")
      end
      it 'name_kanaは数字では登録できない' do
        @user.name_kana = "123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kanaは全角カタカナで入力してください")
      end
      it 'birth_dateがなければ登録できない' do
        @user.birth_date = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth dateを入力してください")
      end
      it 'prefecture_idがなければ登録できない' do
        @user.prefecture_id = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefectureを入力してください")
      end
      it 'prefecture_idは"---"では登録できない' do
        @user.prefecture_id = "1"
        @user.valid?
        expect(@user.errors.full_messages).to include("Prefectureを選択してください")
      end
      it 'city_blockがなければ登録できない' do
        @user.city_block = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("City blockを入力してください")
      end
      it 'imageがなければ登録できない' do
        @user.image = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Imageを入力してください")
      end
    end
  end
end
