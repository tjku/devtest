print 'Creating panel providers... '

3.times { |i| PanelProvider.find_or_create_by!(code: i) }

puts "Done! #{PanelProvider.count} records were created."
