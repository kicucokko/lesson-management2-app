class Calender < ApplicationRecord

  belongs_to :user

  with_options presence:true do
    validates :day
    validates :time 
  end
  validate :no_before_day
  validate :no_today
  validate :no_after_three_month



  def self.calenders_after_three_month
    calenders = Calender.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
    calender_data = []
    calenders.each do |calender|
      calenders_hash = {}
      calenders_hash.merge!(day: calender.day.strftime("%Y-%m-%d"), time: calender.time)
      calender_data.push(calenders_hash)
    end
    calender_data
  end

  def no_before_day
    errors.add(:day, ":過去の日付は予約できません") if day.nil? || day < Date.current
  end

  def no_today
    errors.add(:day, ":当日は予約できません") if day == Date.current 
  end

  def no_after_three_month
    errors.add(:day, ":3ヶ月以降の日付はまだ予約できません") if day.nil? || Date.current.since(3.month) < day
  end
end
