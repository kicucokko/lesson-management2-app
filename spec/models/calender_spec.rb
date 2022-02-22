require 'rails_helper'

RSpec.describe Calender, type: :model do
  before do
    @user = FactoryBot.build(:user)
    @calender = FactoryBot.build(:calender)
  end
  describe 'レッスン予約登録'do
    context 'レッスン予約登録ができる' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@calender).to be_valid
      end
    end
    context 'レッスン予約登録ができない' do
      it 'dayが空では登録できない' do
        @calender.day = nil
        @calender.valid?
        expect(@calender.errors.full_messages).to include("Dayを入力してください")
      end
      it '過去の日付では登録できない' do
        @calender.day = "1991/01/01"
        @calender.valid?
        expect(@calender.errors.full_messages).to include("Day:過去の日付は予約できません")
      end
      it '当日は登録できない' do
        @calender.day = Date.current
        @calender.valid?
        expect(@calender.errors.full_messages).to include("Day:当日は予約できません")
      end
      it '3ヶ月以降は登録できない' do
        @calender.day = Date.current.since(3.month)+1
        @calender.valid?
        expect(@calender.errors.full_messages).to include("Day:3ヶ月以降の日付はまだ予約できません")
      end
      it 'timeが空では登録できない' do
        @calender.time = nil
        @calender.valid?
        expect(@calender.errors.full_messages).to include("Timeを入力してください")
      end
    end
  end
end

