module EventsHelper
 def participate
  @boolean = false
  if current_user != User.find(@admin)
    puts "current user pas admin"
   Attendance.all.each do |att|
    if att.user_id == current_user.id
      if att.event_id == @event.id
        @boolean = true
      end
      end
     end
    end
  end    
end

