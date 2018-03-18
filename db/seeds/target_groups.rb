print 'Creating target groups... '

def make_children(root, level_deep = 3)
  current_node = root
  level_deep.times do
    child = current_node.children.create!(
      name: Faker::Lorem.word,
      external_id: Faker::Number.number(3),
      secret_code: Faker::Number.number(3)
    )
    current_node = child
  end
end

PanelProvider.all.each do |panel_provider|
  root = panel_provider.target_groups.create!(
    name: Faker::Lorem.word,
    external_id: Faker::Number.number(3),
    secret_code: Faker::Number.number(3)
  )
  make_children(root)
end

random_panel_provider = PanelProvider.offset(rand(PanelProvider.count)).first
root = random_panel_provider.target_groups.create!(
  name: Faker::Lorem.word,
  external_id: Faker::Number.number(3),
  secret_code: Faker::Number.number(3)
)
make_children(root)

puts "Done! #{TargetGroup.count} records were created."
