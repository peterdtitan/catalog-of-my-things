require_relative '../item'
require_relative '../label/label'

describe Label do
  context 'Test the label class' do
    before :each do
      @new_label = Label.new('Title', 'Color')
      @new_item = Item.new('Item')
    end

    it 'should be an instance of label class' do
      expect(@new_label).to be_instance_of(Label)
    end

    it 'returns title from the input data' do
      expect(@new_label.title).to eq('Title')
    end

    it 'returns color from the input data' do
      expect(@new_label.color).to eq('Color')
    end

    it 'returns items from the input data' do
      expect(@new_label.items).to be_instance_of(Array)
    end
  end
end
