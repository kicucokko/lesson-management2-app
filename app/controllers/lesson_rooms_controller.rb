class LessonRoomsController < ApplicationController
  def new
    @lesson_room =LessonRoom.new
  end
  def create
    @lesson_room = LessonRoom.new(room_params)
    if @lesson_room.save
      redirect_to user_path(current_user.id) 
    else
      render :new
    end
  end
  def show
    @lesson_room = LessonRoom.find(params[:id])
    @review = @lesson_room.reviews
    @reviews = @review.all
  end
  private
  def room_params
    params.require(:lesson_room).permit(:room_name, user_ids: [])
  end
end
