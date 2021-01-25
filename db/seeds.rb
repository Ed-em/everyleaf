# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


tasks = ['Go Shopping', 'Work', 'Meet', 'Code']
tasks.each do |task|
  Task.create!( title: task,
                content: 'Description of Task',
                deadline: '2020-11-06',
                status: 'Incompleted',
                priority: 'Medium',
                user_id: 1)
end

labels = ['Routine', 'Work Related', 'Health', 'Social']
labels.each do |label|
  Label.create!(name: label,
                user_id: 1)
end

4.times do
  Labelling.create!(label_id: Faker::Number.between(from: 1, to: 4),
                    task_id: Faker::Number.between(from: 1, to: 4))
end
