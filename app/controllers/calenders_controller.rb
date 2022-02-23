class CalendersController < ApplicationController
  before_action :authenticate_user!
  authorize_resource # Abilty.rbのルールチェック
  before_action :set_calender, only:[:show,:destroy]
  
  def index
    @calenders = Calender.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end
  def new
    @calender = Calender.new
    @day = params[:day]
    @time = params[:time]
    @start_time = DateTime.parse(@day + " " + @time + " " + "JST")
  end

  def create
    @calender = Calender.new(calender_params)
    if @calender.save
      redirect_to calender_path @calender.id
    else
      render :new
    end
  end

  def show
  end

  def destroy
    @calender.destroy
    redirect_to calenders_path
  end


  private
  def calender_params
    params.require(:calender).permit(:day, :time, :user_id, :start_time)
  end
  def set_calender
    @calender = Calender.find(params[:id])
  end
end
