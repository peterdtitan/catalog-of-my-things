require_relative './author'

module AUTHOR
  def list_all_authors
    puts 'No authors available!' if @authors.empty?
    return if @authors.empty?

    puts
    puts 'All authors:'
    @authors.each do |author|
      puts "ID: #{author.id}, Name: #{author.first_name} #{author.last_name}"
    end
  end

  def add_author
    first_name = get_input('Enter author\'s first name: ')
    last_name = get_input('Enter author\'s last name: ')
    author = Author.new(first_name, last_name)
    @authors << author
    save_authors
    puts 'Author added successfully!'
  end

  def save_authors
    all_authors = []
    @authors.each do |author|
      all_authors << {
        id: author.id,
        first_name: author.first_name,
        last_name: author.last_name
      }
    end
    authors_json = JSON.generate(all_authors)
    File.write('./data/authors.json', authors_json)
  end

  def read_authors_data
    file_path = './data/authors.json'
    authors_data = nil
    if File.exist?(file_path)
      authors_json = File.read(file_path)
      authors_data = JSON.parse(authors_json)
    end
    authors_data
  end

  def load_authors
    authors = read_authors_data
    return unless authors

    authors.each do |author|
      id = author['id']
      first_name = author['first_name']
      last_name = author['last_name']
      new_author = Author.new(first_name, last_name, id: id)
      @authors << new_author
    end
  end
end
