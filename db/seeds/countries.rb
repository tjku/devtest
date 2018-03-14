print 'Creating countries... '

PanelProvider.all.each do |panel_provider|
  panel_provider.countries.create(
    country_code: Faker::Address.country_code
  )
end

puts "Done! #{Country.count} records were created."
