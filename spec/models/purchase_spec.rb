require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @purchase = FactoryBot.build(:purchase)
  end

  context '内容に問題ない場合' do
    it "priceとtokenがあれば保存ができること" do
      expect(@purchase).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "priceが空では保存ができないこと" do
      @purchase.price = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Priceを入力してください")
    end
    it "tokenが空では登録できないこと" do
      @purchase.token = nil
      @purchase.valid?
      expect(@purchase.errors.full_messages).to include("Tokenを入力してください")
    end
  end
end
