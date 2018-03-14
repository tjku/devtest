namespace :db do
  desc 'Erases all tables'
  task clear: :environment do
    Rails.application.eager_load!
    ActiveRecord::Base.descendants.each do |model|
      print "Deleting data from #{model}... "
      count = model.delete_all
      puts "Done! #{count} records were deleted."
    end
  end
end
