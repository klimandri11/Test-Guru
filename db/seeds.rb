# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ name: 'Andrey' }, { name: 'Lera' }])

categories = Category.create!([{ title: 'SQL' }, { title: 'NOSQL' }, { title: 'Rails' }])

tests = Test.create!([
  { title: 'SQL', level: 0, category_id: categories[0].id, user_id: users[0].id },
  { title: 'ArangoDB', level: 1, category_id: categories[1].id, user_id: users[1].id },
  { title: 'Rails', level: 2, category_id: categories[2].id, user_id: users[0].id }
])

questions = Question.create!([
  { text: 'Каким типом баз данных позволяет управлять язык SQL?', test_id: tests[0].id },
  { text: 'Что представляет собой база данных? ', test_id: tests[1].id },
  { text: 'Под какую платформу написан Rails?', test_id: tests[2].id },
  { text: 'Какой язык запросов используется? ', test_id: tests[1].id }
])

answers = Answer.create!([
  { text: 'Реляционными', correct: true, question_id: questions[0].id },
  { text: 'Множество коллекций', correct: true, question_id: questions[1].id },
  { text: 'AQL', correct: true, question_id: questions[3].id },
  { text: 'ios', question_id: questions[2].id }
])

completed_tests = CompletedTest.create!([
  {user_id: users[0].id, test_id: tests[0].id},
  {user_id: users[0].id, test_id: tests[1].id}
])
