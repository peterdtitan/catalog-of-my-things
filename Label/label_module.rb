module LABEL
  def add_label
    title = get_data('Enter label title: ')
    color = get_data('Enter color: ')
    label = Label.new(title, color)
    @labels << label
    save_label
    puts 'Label has been added!'
  end

  def save_label
    all_labels = []
    @labels.each do |label|
      all_labels << {
        id: label.id,
        title: label.title,
        color: label.color
      }
    end
    labels_json = JSON.generate(all_labels)
    File.write('./data/labels.json', labels_json)
  end

  def list_all_labels
    puts 'Nothing to list here!' if @labels.empty?
    @labels.each do |label|
      puts "\nLabel ID: #{label.id} Title: #{label.title} Color: #{label.color}"
    end
  end

  def read_labels
    file_path = './data/labels.json'
    labels_data = nil
    if File.exist?(file_path)
      labels_json = File.read(file_path)
      labels_data = JSON.parse(labels_json)
    end
    labels_data
  end

  def load_labels
    labels = read_labels
    return unless labels

    labels.each do |label|
      id = label['id']
      title = label['title']
      color = label['color']
      new_label = Label.new(title, color, id: id)
      @labels << new_label
    end
  end
end
