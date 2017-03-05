# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

person = CoreBox::Person.first_or_create!(
  email:      'admin@example.com',
  password:   'password',
  first_name: 'baba',
  last_name:  'daku')

admin_role = CoreBox::Role.first_or_create!(name: 'admin')
hr_role = CoreBox::Role.first_or_create!(name: 'hr')

CoreBox::PersonRole.first_or_create!(
  person: person,
  role: admin_role)

topic1 = Topic.first_or_create!(
  name:  'GoalSheet feedback Q3',
  person: person)
topic2 = Topic.first_or_create!(
  name:         'Self Goal (lol)',
  rating_scale: 10,
  person:       person)

q1 = Question.first_or_create!(
  question_type: Question.question_types[:subjective],
  content:       'Why this cola very D?',
  topic:         topic1)

q2 = Question.first_or_create!(
  question_type: Question.question_types[:rating],
  content:       "How much you rate on coding a scale of 1 to 10?",
  topic:         topic2)

a1 = Answer.first_or_create!(
  question: q1,
  content:  'Ask Dhanush')

a2 = Answer.first_or_create!(
  question: q2,
  content:  'Tada',
  rating:   8)
