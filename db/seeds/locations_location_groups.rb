print 'Connects locations with location groups... '

Location.all.each do |location|
  LocationGroup.all.each do |location_group|
    location_group.locations << location if [true, false].sample
  end
end

puts "Done! #{LocationsLocationGroup.count} connections were created."
