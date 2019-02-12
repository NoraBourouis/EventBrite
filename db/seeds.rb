require 'faker'

10.times do
	user = User.create!(first_name: Faker::Lebowski.character,last_name: Faker::LordOfTheRings.character,description: Faker::Lorem.sentence,email: Faker::Internet.email, password: Faker::Internet.password)
end

20.times do
	event = Event.create!(start_date: (Time.now+6000).to_date, duration: 25, title: "C'est notre titre", description: "Voila c'est notre description, on va faire ça et ça et ça",location: "Strasbourg", price: 150, admin_id: rand(1..10))
end

20.times do
	attendance = Attendance.create!(user_id: rand(1..10), event_id: rand(1..10), stripe_customer_id: Faker::Dessert.variety)
end