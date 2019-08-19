if Teacher.count.zero?
  puts 'Seeding Teachers'
  Teacher.create!(first_name: 'Галина', last_name: 'Кражева', description: 'Main Teacher')
  Teacher.create!(first_name: 'John', last_name: 'Dow', description: 'Second Teacher')
  Teacher.create!(first_name: 'Joan', last_name: 'Dow', description: 'Third  Teacher')
end