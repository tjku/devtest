print 'Connects countries with target groups... '

Country.all.each do |country|
  TargetGroup.roots.each do |target_group|
    target_group.countries << country if [true, false].sample
  end
end

puts "Done! #{CountriesTargetGroup.count} connections were created."
