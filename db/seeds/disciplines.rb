if Discipline.count.zero?
  puts 'Seeding Disciplines'

  %w(Дизайн Скетчинг).each do |name|
    Discipline.create!(name: name)
  end
end