class ReviewsController < ApplicationController
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
    @lesson_room = Review.where(id: params[:lesson_room_id])
  end


  private
  def review_params
    params.require(:review).permit(:time,:title,:text,:home_work,:information).merge(user_id: current_user.id,lesson_room_id: params[:lesson_room_id])
  end
end