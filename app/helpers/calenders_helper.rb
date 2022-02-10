module CalendersHelper
  def times
    times = ["9:00",
             "10:00",
             "11:00",
             "13:00",
             "14:00",
             "15:00",
             "16:00",
             "17:00",
             "18:00",
             "19:00"]
  end
  def check_calender(calenders, day, time)
    result = false
    calenders_count = calenders.count
    if calenders_count > 1
      calenders.each do |calender|
        result = calender[:day].eql?(day.strftime("%Y-%m-%d")) && calender[:time].eql?(time)
        return result if result
      end
    elsif calenders_count == 1
      result = calenders[0][:day].eql?(day.strftime("%Y-%m-%d")) && calenders[0][:time].eql?(time)
      return result if result
    end
    return result
  end
end
