class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = current_user
    @lesson_rooms = @user.lesson_rooms
    @calender = @user.calenders.max
  end
end