# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


people = [["Carly", "Fiorina", "female", 1954],
          ["Donald", "Trump", "male", 1946],
          ["Ben", "Carson", "male", 1951],
          ["Hillary", "Clinton", "female", 1947]]

users = User.create! people.map{|p| {username: p[1], password_digest: p[1].downcase}}

Profile.create! people.zip(users).map{|p, u|
  {first_name: p[0], last_name: p[1], gender: p[2], birth_year: p[3], user: u}}

lists = TodoList.create! people.zip(users).map{|p, u|
  {list_name: "#{p[0]}'s TODO", list_due_date: Date.today.next_year, user: u}}

TodoItem.create! lists.product((1..5).to_a).map{|l, i|
  {due_date: Date.today.next_year, title: "Item #{i}", description: "Description #{i}",
   completed: false, todo_list: l}}
