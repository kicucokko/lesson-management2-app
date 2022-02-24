class ReviewsController < ApplicationController
  authorize_resource # Abilty.rbのルールチェック
  before_action :set_lessno_room, only:[:new,:create]
  before_action :find_review, only:[:edit,:update,:destroy]
  
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
    @lesson_room = Review.find(params[:lesson_room_id])
  end
  def edit
    @lesson_room = LessonRoom.find(params[:id])
  end
  def update
    lesson_room = LessonRoom.find(params[:id])
   
    review = Review.find(params[:lesson_room_id])

    if review.update(review_params)
     redirect_to lesson_room_path(review.lesson_room.id)
    else
      render :edit
    end
  end
  def destroy
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
  def find_review
    @review = Review.find_by(id: params[:lesson_room_id])
  end
end