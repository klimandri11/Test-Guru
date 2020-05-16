# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ name: 'Andrey' }, { name: 'Lera' }])

categories = Category.create([{ title: 'SQL' }, { title: 'NOSQL' }, { title: 'Rails' }])

tests = Test.create([{ title: 'SQL', level: 0, category_id: 1, user_id: 1 },
  { title: 'ArangoDB', level: 1, category_id: 2, user_id: 2 },
  { title: 'Rails', level: 2, category_id: 3, user_id: 1 }])

questions = Question.create([
  { text: 'Каким типом баз данных позволяет управлять язык SQL?', test_id: 1 },
  { text: 'Что представляет собой база данных? ', test_id: 2 },
  { text: 'Под какую платформу написан Rails?', test_id: 3 },
  { text: 'Какой язык запросов используется? ', test_id: 2 }])

answers = Answer.create([{ text: 'Реляционными', correct: true, question_id: 1 },
  { text: 'Множество коллекций', correct: true, question_id: 2 },
  { text: 'AQL', correct: true, question_id: 2 },
  { text: 'ios', question_id: 3 }])
