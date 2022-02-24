class LessonRoomsController < ApplicationController
  authorize_resource # Abilty.rbのルールチェック
  before_action :set_lesson_room, only:[:show,:edit,:update,:destroy]

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
    @users = @lesson_room.users
    @review = @lesson_room.reviews
    @reviews = @review.all
  end
  def edit
  end
  def update
    if @lesson_room.update(room_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end
  def destroy
    @lesson_room.destroy
    redirect_to user_path(current_user.id) 
  end

  private
  def room_params
    params.require(:lesson_room).permit(:room_name, user_ids: [])
  end
  def set_lesson_room
    @lesson_room = LessonRoom.find(params[:id])
  end
end