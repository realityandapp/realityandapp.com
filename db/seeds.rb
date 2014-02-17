# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
Menu.where(name: '网站制作').first_or_create(url: '/')
Menu.where(name: '应用开发').first_or_create(url: '/')
Menu.where(name: '微信、易信平台搭建').first_or_create(url: '/')
Menu.where(name: '案例展示').first_or_create(url: '/')
Menu.where(name: '联系我们').first_or_create(url: '/')
