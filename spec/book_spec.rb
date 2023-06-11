require_relative '../Book/book'

describe Book do
  let(:publish_date) { '2010/01/01' }
  let(:publisher) { 'Publisher A' }
  let(:cover_state) { 'good' }
  let(:book_instance) { Book.new(publish_date, publisher, false, cover_state: cover_state) }

  context '#initialize' do
    it 'sets the publish date' do
      expect(book_instance.publish_date).to eq(publish_date)
    end

    it 'sets the publisher' do
      expect(book_instance.publisher).to eq(publisher)
    end

    it 'sets the cover state' do
      expect(book_instance.cover_state).to eq(cover_state)
    end
  end

  context '#id' do
    it 'returns a unique identifier for the book' do
      expect(book_instance.id).not_to be_nil
    end
  end

  context '#can_be_archived?' do
    it 'returns true if a book\'s publish date is older than ten years' do
      expect(book_instance.can_be_archived?).to eq true
    end
    it 'returns false if a book\'s publish date is earlier than ten years and the cover state is good' do
      new_book = Book.new('2020/01/01', 'Macmillian', false, cover_state: 'good')
      expect(new_book.can_be_archived?).to eq false
    end
    it 'returns true if a book\'s publish date is earlier than ten years and the cover state is bad' do
      new_book = Book.new('2020/01/01', 'Macmillian', false, cover_state: 'bad')
      expect(new_book.can_be_archived?).to eq true
    end
  end
end
