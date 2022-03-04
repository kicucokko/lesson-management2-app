class ReviewsController < ApplicationController
  authorize_resource # Abilty.rbのルールチェック
  before_action :set_lessno_room, only:[:new,:create]
  
  def new
    @review = Review.new
  end
  def create
    @review = @lesson_room.reviews.new(review_params)
    if @review.save
      redirect_to lesson_room_path(@lesson_room.id)
    else
      render :new
    end
  end
  def show
    @review = Review.where(id: params[:lesson_room_id])
    @lesson_room = LessonRoom.find(params[:id])
  end
  def edit
    @review = Review.find(params[:lesson_room_id])
    @lesson_room = LessonRoom.find(params[:id])
  end
  def update
    @review = Review.find(params[:id])
    @lesson_room = LessonRoom.find(params[:lesson_room_id])
    if @review.update(review_params)
     redirect_to lesson_room_path(@review.lesson_room.id)
    else
      render :edit
    end
  end
  def destroy
    @review = Review.find_by(id: params[:lesson_room_id])
    @review.destroy
    redirect_to  lesson_room_path(@review.lesson_room.id)
  end

  private
  def review_params
    params.require(:review).permit(:time,:title,:text,:home_work,:information,:image).merge(user_id: current_user.id,lesson_room_id: params[:lesson_room_id])
  end
  def set_lessno_room
    @lesson_room = LessonRoom.find(params[:lesson_room_id])
  end
end