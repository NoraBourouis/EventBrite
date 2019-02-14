module EventsHelper
 def participate
  if current_user != User.find(@admin)
    puts "current user pas admin"
    Attendance.all.each do |attendance| 
      if attendance.user_id == current_user.id && attendance.event_id == @event.id
        return false
        break
      else 
        return true
      end
    end
   end
  end
end
