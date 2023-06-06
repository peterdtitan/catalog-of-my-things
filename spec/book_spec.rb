require_relative '../book/book'

describe Book do
  context 'Test the book class' do
    before :each do
      @new_book = Book.new('2019-01-01', 'Publisher', false, cover_state: 'good')
    end

    it 'should be an instance of book class' do
      expect(@new_book).to be_instance_of(Book)
    end

    it 'returns publisher from the input data' do
      expect(@new_book.publisher).to eq('Publisher')
    end

    it 'returns cover state from the input data' do
      expect(@new_book.cover_state).to eq('good')
    end

    it 'returns archived state from the input data' do
      expect(@new_book.archived).to eq(false)
    end
  end
end
