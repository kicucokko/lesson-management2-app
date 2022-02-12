class ReviewsController < ApplicationController
  authorize_resource # Abilty.rbのルールチェック
  def new
    @review = Review.new
  end
  def create
    @lesson_room = LessonRoom.find(params[:lesson_room_id])
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
    @review = Review.find_by(id: params[:lesson_room_id])
  end
  def update
    @lesson_room = LessonRoom.find(params[:id])
    @review = Review.find_by(id: params[:lesson_room_id])
    if @review.update(review_params)
     redirect_to lesson_room_path
    else
      render :edit
    end
  end
  def destroy
    @lesson_room = LessonRoom.find(params[:id])
    @review = Review.find_by(id: params[:lesson_room_id])
    @review.destroy
    redirect_to  lesson_room_path(@lesson_room.id)
  end

  private
  def review_params
    params.require(:review).permit(:time,:title,:text,:home_work,:information).merge(user_id: current_user.id,lesson_room_id: params[:lesson_room_id])
  end
end