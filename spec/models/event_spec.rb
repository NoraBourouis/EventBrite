require 'rails_helper'

RSpec.describe Event, type: :model do

  before(:each) do 
    @user = User.create(first_name: "John", last_name: "Doe",description: "LALALA",email: "marylis@yopmail.com", encrypted_password: "YTU87678")
  
    @event = Event.create(start_date: (Time.now+6000).to_date, duration: 25, title: "C'est notre titre", description: "Voila c'est notre description, on va faire ça et ça et ça",location: "Strasbourg", price: 150, admin_id: @user.id)
  
  end
  
    context "validation" do
  
      it "is valid with valid attributes" do
        expect(@event).to be_a(Event)
        expect(@event).to be_valid
      end
  
      describe "title" do
        it "should not be valid without title" do
          bad_event = Event.create(location: "Strasbourg",start_date: (Time.now+6000).to_date, duration: 25, description: "Voila c'est notre description, on va faire ça et ça et ça", price: 150, admin_id: @user.id)
          expect(bad_event).not_to be_valid
          expect(bad_event.errors.include?(:title)).to eq(true)
        end
      end
    end
=begin  
      context "associations" do
  
        describe "events" do
          it "should have_many users" do
            event = Event.create(start_date: (Time.now+6000).to_date, duration: 25, title: "C'est notre titre", description: "Voila c'est notre description, on va faire ça et ça et ça",location: "Strasbourg", price: 150, admin_id: rand(114..123))
            expect(@user.events.include?(event)).to eq(true)
          end
        end
      end
=end
end
  
