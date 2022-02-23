class ReviewsController < ApplicationController
  authorize_resource # Abilty.rbのルールチェック
  before_action :set_lessno_room, only:[:new,:create,:show]
  before_action :find_lessno_room, only:[:edit,:update,:destroy]
  
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
  end
  def edit
  end
  def update
    if @review.update(review_params)
     redirect_to lesson_room_path
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
  def find_lesson_room
    @review = Review.find_by(id: params[:lesson_room_id])
  end
end