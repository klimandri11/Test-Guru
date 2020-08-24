# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ title: 'SQL' }, { title: 'NOSQL' }, { title: 'Rails' }])

tests = Test.create!([
  { title: 'SQL', level: 0, category: categories[0], author: users[0], timer: 10 },
  { title: 'ArangoDB', level: 1, category: categories[1], author: users[0], timer: 20 },
  { title: 'Rails', level: 2, category: categories[2], author: users[0], timer: 10 }
])

questions = Question.create!([
  { text: 'Каким типом баз данных позволяет управлять язык SQL?', test: tests[0] },
  { text: 'Что представляет собой база данных? ', test: tests[1] },
  { text: 'Под какую платформу написан Rails?', test: tests[2] },
  { text: 'Какой язык запросов используется? ', test: tests[1] }
])

answers = Answer.create!([
  { text: 'Реляционными', correct: true, question: questions[0] },
  { text: 'Не реляционными', question: questions[0] },
  { text: 'Множество коллекций', correct: true, question: questions[1] },
  { text: 'Множество папок', question: questions[1] },
  { text: 'Множество записей', question: questions[1] },
  { text: 'AQL', correct: true, question: questions[3] },
  { text: 'SQL', question: questions[3] },
  { text: 'RQL', question: questions[3] },
  { text: 'LQL', question: questions[3] },
  { text: 'IOS', question: questions[2] },
  { text: 'Android', question: questions[2] },
  { text: 'Кроссплатформенность', correct: true, question: questions[2] }
])
