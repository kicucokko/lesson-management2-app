class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])

    @lesson_rooms = @user.lesson_rooms
    
    @calenders =Calender.includes(:user).order("day,time ASC")
    @calender = @user.calenders.order("day ASC")
    @calender.each do |calender|
      if calender.day >= Date.today
         @calender_min = calender
         break
      end  
    end 
  end
end