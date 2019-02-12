class Attendance < ApplicationRecord
  
  after_create :join_send
  
  belongs_to :event 
  belongs_to :user
  validates :stripe_customer_id, uniqueness: true 
  validates :user_id, presence: true

  def join_send
    AdminMailer.join_email(Event.find(event_id)).deliver_now
  end


end
