class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])

    @lesson_rooms = @user.lesson_rooms
    
    @calenders =Calender.includes(:user).order("day,time ASC")
    @calender = @user.calenders.order("day ASC")
    @calender_min = Calender.where("day > ?",Date.today)
  end
end