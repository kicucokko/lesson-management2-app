class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])

    @lesson_rooms = @user.lesson_rooms
    
    @calenders =Calender.includes(:user).order("day,time ASC")
    @calender = @user.calenders.order("day ASC")
    @calender_futures = @calender.where('day >= ?', Date.current)
    @calender_future = @calender_futures.min
  end
end