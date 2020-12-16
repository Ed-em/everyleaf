require 'rails_helper'
describe 'Task model function', type: :model do
  context 'Validation test' do
    it 'It ensures title is present' do
      task = Task.new(title: '', content: 'fail test').save
      expect(task).to eq(false)
    end
    it 'It ensures content is present' do
      task = Task.new(title: 'title', content: '').save
      expect(task).to eq(false)
    end
    it 'Validation passes' do
      task = Task.new(title: 'title', content: 'pass test').save
      expect(task).to eq(true)
    end
  end
end
