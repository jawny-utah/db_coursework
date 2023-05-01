ActiveRecord::Base.transaction do
  30.times do
    Client.create(first_name: Faker::Name.unique.first_name,
                  last_name:Faker::Name.unique.last_name,
                  email: Faker::Internet.unique.email,
                  phone_number: Faker::PhoneNumber.unique.cell_phone,
                  date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65),
                  balance: rand(0..10000))
    Administrator.create(first_name: Faker::Name.unique.first_name,
                         last_name: Faker::Name.unique.last_name,
                         personal_information: Faker::IDNumber.unique.valid,
                         email: Faker::Internet.unique.email,
                         phone_number: Faker::PhoneNumber.unique.cell_phone,
                         date_of_birth: Faker::Date.birthday(min_age: 18, max_age: 65))
    Scooter.create(model: Faker::Camera.unique.brand_with_model,
                   range: rand(20..50),
                   weight: rand(10..25),
                   max_speed: rand(20..55),
                   power: rand(90..600),
                   price_per_minute: rand(5..13))
    City.create(name: Faker::Address.unique.city)
  end

  all_subscriptions = [
    Subscription.create(name: "Все за один день", duration: 1440, price: 69),
    Subscription.create(name: "Безкоштовні хвилини S", duration: 4320, price: 120),
    Subscription.create(name: "Безкоштовні хвилини M", duration: 10080, price: 219),
    Subscription.create(name: "Безкоштовні хвилини L", duration: 43200, price: 639)
  ]

  Client.all.sample(27).each do |client|
    selected_subscription = all_subscriptions.sample
    subscription_started_time = Faker::Time.between(from: DateTime.now - 40.days, to: DateTime.now, format: :default).to_datetime

    ClientSubscription.create(client: client,
                              subscription: selected_subscription,
                              started_at: subscription_started_time,
                              expires_at: subscription_started_time + (selected_subscription.duration).minutes)
  end

  Scooter.all.each do |scooter|
    scooter.scooter_in_works.create(battery_capacity: rand(85..100),
                                    current_battery: rand(40..100),
                                    current_location: "#{Faker::Address.latitude} #{Faker::Address.longitude}",
                                    city: City.all.sample)
  end

  100.times do
    started_at = Faker::Time.between(from: DateTime.now - 60.days, to: DateTime.now - 10.days).to_datetime
    ended_at = started_at + rand(20..40).minutes
    scooter_in_work = ScooterInWork.all.sample
    trip_duration_in_minutes = ((ended_at - started_at) * 24 * 60).to_i

    order = Order.create(client: Client.all.sample,
                         scooter_in_work: scooter_in_work,
                         started_at: Faker::Time.between(from: DateTime.now - 60.days, to: DateTime.now - 10.days).to_datetime,
                         ended_at: ended_at,
                         total_sum: scooter_in_work.price_per_minute * trip_duration_in_minutes )
    Review.create(order: order, rate: rand(1..5), body: Faker::GreekPhilosophers.quote)

    Transaction.create(order: order, status: rand(0..3))
  end
end
