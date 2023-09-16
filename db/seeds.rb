admin = User.create(email: 'admin@admin.com', username: 'admin', password: '123456')

(1..40).each do |i|
  Author.create(
    name: Faker::Book.author,
    description: Faker::Quotes::Shakespeare.king_richard_iii_quote,
    dob: Date.today - (i * 100).days,
    language: "English",
    user: admin
  )
end

(1..40).each do |i|
  Book.create(
    title: Faker::Book.title,
    description: Faker::Quotes::Shakespeare.king_richard_iii_quote,
    language: "English",
    user: admin,
    genre: 'whatever',
    page_count: '999',
    rating: '5',
    author_id: rand(Author.all.length) -1
  )
end
