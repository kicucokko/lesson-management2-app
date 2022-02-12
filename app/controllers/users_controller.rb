class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @lesson_rooms = @user.lesson_rooms
    @calender = @user.calenders.max
  end
end