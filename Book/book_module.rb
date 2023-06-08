require 'json'
require_relative './book'
require_relative '../Label/label'

module BookModule
  def get_data(txt)
    puts txt
    gets.chomp
  end

  def add_book
    publisher = get_data('Enter book publisher: ')
    publish_date = get_data('Enter book publish date [dd/mm//yyyy]: ')
    cover_state = get_data('Enter book cover state [good/bad]: ')
    new_book = Book.new(publish_date, publisher, false, cover_state: cover_state)
    @books << new_book
    save_book
    puts 'Book has been added!'
  end

  def list_all_books
    puts 'Nothing to list here!' if @books.empty?
    @books.each do |book|
      puts "\nBook ID: #{book.id} Book Publisher: #{book.publisher} Published on:
                #{book.publish_date} Cover State is: #{book.cover_state}"
    end
  end

  def save_book
    all_books = []
    @books.each do |book|
      all_books << {
        id: book.id,
        publisher: book.publisher,
        publish_date: book.publish_date,
        cover_state: book.cover_state
      }
    end
    books_json = JSON.generate(all_books)
    File.write('./data/books.json', books_json)
  end

  # Loading data from json files

  def read_books
    file_path = './data/books.json'
    books_data = nil
    if File.exist?(file_path)
      books_json = File.read(file_path)
      books_data = JSON.parse(books_json)
    end
    books_data
  end

  def load_books
    books = read_books
    return unless books

    books.each do |book|
      id = book['id']
      publish_date = book['publish_date']
      publisher = book['publisher']
      cover_state = book['cover_state']
      new_book = Book.new(publish_date, publisher, false, cover_state: cover_state, id: id)
      @books << new_book
    end
  end
end
