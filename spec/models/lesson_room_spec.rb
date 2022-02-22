require 'rails_helper'

RSpec.describe LessonRoom, type: :model do
  before do
    @user =FactoryBot.build(:user)
    @lesson_room = FactoryBot.build(:lesson_room)
  end

  describe 'レッスンルームを作成する'do
    context '新規作成ができる' do
      it 'ルーム名があれば新規作成できる' do
        expect(@lesson_room).to be_valid
      end
    end
    context '新規作成ができない' do
      it 'ルーム名がなければ新規作成できない' do
        @lesson_room.room_name = ""
        @lesson_room.valid?
        expect(@lesson_room.errors.full_messages).to include("Room nameを入力してください")
      end
    end
  end
end
