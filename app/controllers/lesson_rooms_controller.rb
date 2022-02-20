class LessonRoomsController < ApplicationController
  authorize_resource # Abilty.rbのルールチェック

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
    @users = @lesson_room.users
    
    @review = @lesson_room.reviews
    @reviews = @review.all
  end
  def edit
    @lesson_room = LessonRoom.find(params[:id])
  end
  def update
    @lesson_room = LessonRoom.find(params[:id])
    if @lesson_room.update(room_params)
      redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end
  def destroy
    @lesson_room = LessonRoom.find(params[:id])
    @lesson_room.destroy
    redirect_to user_path(current_user.id) 
  end

  private
  def room_params
    params.require(:lesson_room).permit(:room_name, user_ids: [])
  end
  
end