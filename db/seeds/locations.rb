print 'Creating locations... '

20.times do |i|
  condition = (rand(i) % 2).zero?
  name = condition ? Faker::Address.city : Faker::Address.state

  Location.create(
    name: name,
    external_id: Faker::Number.number(3),
    secret_code: Faker::Number.number(3)
  )
end

puts "Done! #{Location.count} records were created."
