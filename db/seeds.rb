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
  { title: 'SQL', level: 0, category: categories[0], author: users[0] },
  { title: 'ArangoDB', level: 1, category: categories[1], author: users[0] },
  { title: 'Rails', level: 2, category: categories[2], author: users[0] }
])

questions = Question.create!([
  { text: 'Каким типом баз данных позволяет управлять язык SQL?', test: tests[0] },
  { text: 'Что представляет собой база данных? ', test: tests[1] },
  { text: 'Под какую платформу написан Rails?', test: tests[2] },
  { text: 'Какой язык запросов используется? ', test: tests[1] }
])

answers = Answer.create!([
  { text: 'Реляционными', correct: true, question: questions[0] },
  { text: 'Множество коллекций', correct: true, question: questions[1] },
  { text: 'AQL', correct: true, question: questions[3] },
  { text: 'ios', question: questions[2] }
])

completed_tests = CompletedTest.create!([
  {user: users[0], test: tests[0] },
  {user: users[0], test: tests[1] }
])
