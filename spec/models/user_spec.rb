require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = User.create(first_name: "John", last_name: "Doe",description: "LALALA",email: "marylis@yopmail.com", encrypted_password: "YTU87678")

    @event = Event.create(start_date: (Time.now+6000).to_date, duration: 25, title: "C'est notre titre", description: "Voila c'est notre description, on va faire ça et ça et ça",location: "Strasbourg", price: 150, admin_id: @user.id)

  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
      expect(@user).to be_valid
    end

    describe "first_name" do
      it "should not be valid without first_name" do
        bad_user = User.create(last_name: "Doe", description: "LALALA", email: "marylis@yopmail.com", encrypted_password: "YTU875678")
        expect(bad_user).not_to be_valid
        expect(bad_user.errors.include?(:first_name)).to eq(true)
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
