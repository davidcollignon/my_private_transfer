require 'faker'

10.times do
  user = User.new(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.last_name,
    agency: Faker::Company.unique.name,
    agency_address: Faker::Address.full_address,
    email: Faker::Internet.email,
    password: "password"
    )
  user.save!
  #beneficiary = Beneficiary.new(user: user)
end

10.times do
  company = Company.new(
    name: Faker::Company.unique.name,
    address: Faker::Address.full_address,
    email: "clauditiwiesiti@gmail.com"
    )
  company.save!
end

10.times do
  car = Car.new(
    brand: Faker::Company.unique.name,
    description: "Lorem ipsum dolor sit amet",
    passenger_capacity: rand(1..6),
    luggage_capacity: rand(1..10),
    price_per_km_cents: rand(1000..5000),
    price_per_hour_cents: rand(5000..10000),
    company: Company.last
    )
  car.save!
end

puts 'Finished!'
