module BookModule
  def get_data(txt)
    puts txt
    gets.chomp
  end

  def add_book
    publisher = get_data('Enter book publisher: ')
    publish_date = get_data('Enter book publish date: ')
    cover_state = get_data('Enter book cover state [good/bad]: ')
    new_book = Book.new(publisher, publish_date, cover_state)
    save_book(new_book)
  end

  def save_book(book)
    @books << book
    puts 'Book saved!'
  end

  def list_all_books
    puts 'Nothing to list here!' if @books.empty?
    @books.each do |book|
      puts "Book ID: #{book.id} Book Publisher: #{book.publisher} Published on:
                #{book.publish_date} Cover State is: #{book.cover_state}"
    end
  end

  def add_label
    title = get_data('Enter label title: ')
    color = get_data('Enter color: ')
    label = Label.new(title, color)
    save_label(label)
  end

  def save_label(label)
    @labels << label
    puts 'Label has been saved!'
  end

  def list_all_labels
    puts 'Nothing to list here!' if @labels.empty?
    @labels.each do |label|
      puts "Label ID: #{label.id} Title: #{label.title} Color: #{label.color}"
    end
  end
end
