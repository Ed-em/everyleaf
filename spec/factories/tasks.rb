FactoryBot.define do
  factory :task do
    # Please change the following contents according to the column name actually created
    title { 'test_title' }
    content { 'test_content' }
    deadline { '002020-11-24'}

  end

  factory :second_task do
    # Please change the following contents according to the column name actually created
    title { 'test_title1' }
    content { 'test_content2' }
    deadline { '002020-11-24'}

  end
end
