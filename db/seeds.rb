# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Task.create(title: 'Sample Task')
task = Task.create(id: 0, title: 'Wash laundry')
task.tags << Tag.create(title: 'Today')
Task.create(id: 2, title: 'Patch this task')
