require 'rails_helper'

RSpec.describe Attendance, type: :model do
  
  before(:each) do 
    @user = User.create(first_name: "John", last_name: "Doe",description: "LALALA",email: "marylis@yopmail.com", encrypted_password: "YTU87678")

    @event = Event.create(start_date: (Time.now+6000).to_date, duration: 25, title: "C'est notre titre", description: "Voila c'est notre description, on va faire ça et ça et ça",location: "Strasbourg", price: 150, admin_id: @user.id)

    @attendance = Attendance.create(stripe_customer_id: "TYUI578", user_id: @user.id, event_id: @event.id )


  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@attendance).to be_a(Attendance)
      expect(@attendance).to be_valid
    end

    describe "user_id" do
      it "should not be valid without the user_id" do
        bad_attendance = Attendance.create(stripe_customer_id: "TY67I578", event_id: @event.id)
        expect(bad_attendance).not_to be_valid
        expect(bad_attendance.errors.include?(:user_id)).to eq(true)
      end
    end
  end
  
end
