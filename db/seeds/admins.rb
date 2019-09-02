if Admin.count.zero?
  puts 'Seeding admins'
  Admin.create!(first_name: 'John', last_name: 'Dow', email: 'bolist@mail.ru', password: '123456', password_confirmation: '123456')
end