require "csv"
Book.destroy_all
Author.destroy_all

csv_file = Rails.root.join('db/booklist.csv')
csv_data = File.read(csv_file)

books = CSV.parse(csv_data, headers: true)
# Title,Author,Genre,SubGenre,Height,Publisher

# traverse the parsed books CSV file
books.each do |b|
  author = Author.find_or_create_by(name: b["Author"])
  new_book = Book.new(
    title: b["Title"],
    genre: b["Genre"],
    pages: b["Height"],
    publisher: b["Publisher"]
  )
  new_book.author = Author.where(:name => author.name).first
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

# new_category_name = Category.find_or_create_by(name: product["category"])
# new_product = Product.new( title: product["name"],
#                               price: product["price"],
#                               description: product["description"],
#                               stock_quantity: product["stock quantity"].to_i)
# new_product.category = Category.where(:name => new_category_name.name).first
# new_product.save