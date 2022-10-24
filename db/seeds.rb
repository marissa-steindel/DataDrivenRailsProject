Book.destroy_all
Author.destroy_all

# create 30 books
10.times do
  author = Author.create(name: Faker::Book.unique.author)
  puts author unless author.save
  rand(1..6).times do
    title = Faker::Book.unique.title
    synopsis = Faker::Lorem.paragraph(sentence_count: 6)
    author.books.create(title: title, synopsis: synopsis)
  end
end

puts "created #{Author.count} authors"
puts "created #{Book.count} books"
