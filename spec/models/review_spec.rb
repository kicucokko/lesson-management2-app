require 'rails_helper'

RSpec.describe Review, type: :model do
  before do
    @review = FactoryBot.build(:review)
  end
  describe 'レッスン記録新規登録' do
    context 'レッスン記録が登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@review).to be_valid
      end
      it 'iamgeが空でも登録できる' do
        @review.image = nil
        expect(@review).to be_valid
      end
      it 'informationが空でも登録できる' do
        @review.information = ""
        expect(@review).to be_valid
      end
    end
    context 'レッスン記録が登録できないとき' do
      it 'timeが空では登録できない' do
        @review.time = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("Timeを入力してください")
      end
      it 'titleが空では登録できない' do
        @review.title = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("Titleを入力してください")
      end
      it 'textが空では登録できない' do
        @review.text = ""
        @review.valid?
        expect(@review.errors.full_messages).to include("Textを入力してください")
      end
      it 'user_idが紐づいていないと登録できない' do
        @review.user = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Userを入力してください")
      end
      it 'lesson_room_idが紐づいていないと登録できない' do
        @review.lesson_room = nil
        @review.valid?
        expect(@review.errors.full_messages).to include("Lesson roomを入力してください")
      end 
    end
  end
end