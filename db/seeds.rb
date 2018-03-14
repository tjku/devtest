# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

load Rails.root.join('db', 'seeds', 'panel_providers.rb')
load Rails.root.join('db', 'seeds', 'countries.rb')
load Rails.root.join('db', 'seeds', 'locations.rb')
load Rails.root.join('db', 'seeds', 'location_groups.rb')
load Rails.root.join('db', 'seeds', 'locations_location_groups.rb')
load Rails.root.join('db', 'seeds', 'target_groups.rb')
load Rails.root.join('db', 'seeds', 'countries_target_groups.rb')
