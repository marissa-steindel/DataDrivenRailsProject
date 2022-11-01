require "csv"
Book.destroy_all
Author.destroy_all

csv_file = Rails.root.join('db/booklist.csv')
csv_data = File.read(csv_file)

books = CSV.parse(csv_data, headers: true)
# Title,Author,Genre,SubGenre,Height,Publisher

# traverse the parsed products CSV file
books.each do |b|
  # create categories and products
  new_book = Book.new(
    title: b["Title"],
    author_id: rand(10)
  )
  # new_book.save
  unless(new_book.save)
    new_book.errors.messages.each do |column, errors|
      errors.each do |error|
        puts "The #{column} property #{error}."
      end
    end
  end
end

# create  books
# 10.times do
#   author = Author.create(name: Faker::Book.unique.author)
#   puts author unless author.save
#   rand(1..6).times do
#     title = Faker::Book.unique.title
#     synopsis = Faker::Lorem.paragraph(sentence_count: 6)
#     author.books.create(title: title, synopsis: synopsis)
#   end
# end

# puts "created #{Author.count} authors"
puts "created #{Book.count} books"
