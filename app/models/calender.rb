class Calender < ApplicationRecord

  belongs_to :user

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
end
