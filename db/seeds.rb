require 'faker'

3.times do
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

3.times do
  company = Company.new(
    name: Faker::Company.unique.name,
    address: Faker::Address.full_address,
    email: "clauditiwiesiti@gmail.com"
    )
  company.save!
end


caravelle_volkswagen = Car.new(
    brand: "Caravelle Volkswagen",
    description: "Elegant styling, supreme comfort, innovative technology and a dynamic drive make the new generation Caravelle the best Volkswagen.",
    passenger_capacity: 8,
    luggage_capacity: 9,
    price_per_km_cents: 295.85,
    price_per_hour_cents: 7700,
    company: Company.last
    )
car.save!

mercedes_sprinter_8_seater = Car.new(
    brand: "Mercedes Sprinter 8 seater",
    description: "Mercedes-Benz Manhattan has snapped an idea of perfect luxury on the roads with its exclusive range of the Sprinter Capri Edition. The vehicle consists of everything that defines luxury and comfort.",
    passenger_capacity: 8,
    luggage_capacity: 8,
    price_per_km_cents: 298.85,
    price_per_hour_cents: 8537,
    company: Company.last
    )
car.save!

mercedes_v_class_5_seater = Car.new(
    brand: "Mercedes V Class Exclusive 5 seater",
    description: "The V Class has all the hallmarks of a Mercedes-Benz. Striking headlamps, unmistakable grille, and dynamic smooth rounded forms",
    passenger_capacity: 5,
    luggage_capacity: 7,
    price_per_km_cents: 298.85,
    price_per_hour_cents: 8537,
    company: Company.last
    )
car.save!


mercedes_e_class = Car.new(
    brand: "Mercedes E Class",
    description: "Elegant styling, supreme comfort, innovative technology and a dynamic drive make the new generation E-Class the best E-Class ever",
    passenger_capacity: 3,
    luggage_capacity: 2,
    price_per_km_cents: 302.85,
    price_per_hour_cents: 9275,
    company: Company.last
    )
car.save!

mercedes_v_class = Car.new(
    brand: "Mercedes V Class",
    description: "The V Class has all the hallmarks of a Mercedes-Benz. Striking headlamps, unmistakable grille, and dynamic smooth rounded forms",
    passenger_capacity: 7,
    luggage_capacity: 7,
    price_per_km_cents: 302.85,
    price_per_hour_cents: 9275,
    company: Company.last
    )
car.save!

mercedes_e_premium = Car.new(
    brand: "Mercedes E Class Premium",
    description: "Elegant styling, supreme comfort, innovative technology and a dynamic drive make the new generation E-Class the best E-Class ever",
    passenger_capacity: 3,
    luggage_capacity: 2,
    price_per_km_cents: 303.85,
    price_per_hour_cents: 9470,
    company: Company.last
    )
car.save!

mercedes_s_class = Car.new(
    brand: "Mercedes S Class",
    description: "The S class Mercedes has been voted the most beautiful car in the world and is known for both safety and comfort",
    passenger_capacity: 3,
    luggage_capacity: 2,
    price_per_km_cents: 304.85,
    price_per_hour_cents: 9887,
    company: Company.last
    )
car.save!

mercedes_sprinter_16_seater = Car.new(
    brand: "Mercedes Sprinter 16 seater",
    description: "Mercedes-Benz Manhattan has snapped an idea of perfect luxury on the roads with its exclusive range of the Sprinter Capri Edition. The vehicle consists of everything that defines luxury and comfort.",
    passenger_capacity: 16,
    luggage_capacity: 18,
    price_per_km_cents: 308.85,
    price_per_hour_cents: 10225,
    company: Company.last
    )
car.save!









