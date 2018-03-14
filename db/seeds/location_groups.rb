print 'Creating location groups... '

Country.all.each do |country|
  country.location_groups.create(name: Faker::Lorem.word)
end

random_country = Country.offset(rand(Country.count)).first
random_country.location_groups.create(name: Faker::Lorem.word)

puts "Done! #{LocationGroup.count} records were created."
