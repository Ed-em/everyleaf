require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  describe 'New creation function' do
    context 'When creating a new task' do
      it 'Should display created task' do
        visit new_task_path
        fill_in 'Title', with: 'Task1'
        fill_in 'Content', with: 'details'
        click_button 'Create Task'
        expect(page).to have_content 'Task was successfully created.'
      end
    end
  end
  describe 'List display function' do
    context 'When transitioning to the list screen' do
      it 'The created task list is displayed' do
      end
    end
  end
  describe 'Detailed display function' do
     context 'When transitioned to any task details screen' do
       it 'The content of the relevant task is displayed' do
         task = FactoryBot.create(:task, title: 'task1', content: 'content1')
         visit tasks_path(task)
         expect(page).to have_content 'task1'
       end
     end
  end
end
