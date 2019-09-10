if Course.count.zero?
  puts 'Seeding Courses'
  Course.create!(name: 'Курс номер Один', description: 'Новий курс', teacher_id: '1')
  Course.create!(name: 'Курс номер Два', description: 'Новий курс', teacher_id: '2')
end