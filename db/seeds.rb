# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#

person = CoreBox::Person.first_or_create!(email: 'admin@example.com',
                                          password: 'password',
                                          first_name: 'baba',
                                          last_name: 'daku')

role = CoreBox::Role.first_or_create!(name: 'admin')

CoreBox::PersonRole.first_or_create!(person: person, role: role)

t1 = Topic.first_or_create!(name: 'GoalSheet feedback Q3', person: person)
t2 = Topic.first_or_create!(name: 'Self Goal (lol)', rating_scale: 10, person: person)

q1 = Question.first_or_create!(
      question_type: Question.question_types[:subjective],
      content: 'Why this cola very D?',
      topic: t1
    )

q2 = Question.first_or_create!(
      question_type: Question.question_types[:rating],
      content: "How much you rate on coding a scale of 1 to 10?",
      topic: t2
    )

a1 = Answer.first_or_create!(
      question: q1,
      content: 'Ask Dhanush'
    )

a2 = Answer.first_or_create!(
       question: q2,
       content: 'Tada',
       rating: 8
     )
