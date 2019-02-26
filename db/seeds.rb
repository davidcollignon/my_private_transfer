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
  beneficiary = Beneficiary.new(user: user)
end

10.times do
  beneficiary = Beneficiary.new(
    )

puts 'Finished!'
