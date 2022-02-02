class LessonRoomsController < ApplicationController
  def new
    @lesson_room =LessonRoom.new
  end
  def create
    @lesson_room = LessonRoom.new(room_params)
    if @lesson_room.save
      redirect_to user_path(@lesson_room.user_ids) 
    else
      render :new
    end
  end
  def show
  end

  private
  def room_params
    params.require(:lesson_room).permit(:room_name).merge(user_ids: current_user.id)
  end
end
