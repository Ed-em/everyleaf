require 'rails_helper'
RSpec.describe 'Task management function', type: :system do
  describe 'New creation function' do
    context 'When creating a new task' do
      it 'Should display created task' do
        visit new_task_path
        fill_in 'Title', with: 'Task1'
        fill_in 'Content', with: 'details'
        fill_in 'Deadline', with: '002020-11-24'
        select 'Complete'
        select 'High'
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
    context 'When tasks are arranged in descending order of creation date and time' do
      it 'New task is displayed at the top' do
        assert Task.all.order(created_at: :desc)
      end
    end
  end

  describe 'Search function' do
    before do
      FactoryBot.create(:task, title: "title1", content: "content1", deadline: "2021/1/1", status:"Complete", priority: "Low")
    end
    context 'When you search by title' do
      it "Filter by tasks that include search keywords" do
        visit tasks_path
        fill_in 'Title', with: 'title1'
        click_on 'search'
        expect(page).to have_content 'title1'
      end
    end
    context 'When you search by status' do
      it "Tasks that exactly match the status are narrowed down" do
          visit tasks_path
          select 'Complete'
          click_on 'search'
          expect(page).to have_content 'Complete'
      end
    end
    context 'When you search by title and status' do
      it "Tasks that include the search keyword in the title and exactly match the status are narrowed down" do
          visit tasks_path
          fill_in 'Title', with: 'title1'
          select 'Complete'
          click_on 'search'
          expect(page).to have_content 'title1'
          expect(page).to have_content 'Complete'
      end
    end
  end
end
