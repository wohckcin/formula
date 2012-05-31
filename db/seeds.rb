# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# initial User
# puts 'SETTING UP DEFAULT USER LOGIN'
# user = User.create! :username => 'nick', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
# puts 'New user created: ' << user.username
# user2 = User.create! :username => 'solar', :email => 'user2@example.com', :password => 'please', :password_confirmation => 'please'
# puts 'New user created: ' << user2.username
# user.add_role :admin

s1 = Section.create(:name => "Ruby")
Node.create(:name => "Ruby",:description => "...", :section_id => s1.id)
Node.create(:name => "Ruby on Rails",:description => "...", :section_id => s1.id)
Node.create(:name => "Gem",:description => "...", :section_id => s1.id)
s2 = Section.create(:name => "Web Development")
Node.create(:name => "Python",:description => "...", :section_id => s2.id)
Node.create(:name => "Javascript",:description => "...", :section_id => s2.id)
Node.create(:name => "CoffeeScript",:description => "...", :section_id => s2.id)
Node.create(:name => "HAML",:description => "...", :section_id => s2.id)
Node.create(:name => "SASS",:description => "...", :section_id => s2.id)
Node.create(:name => "MongoDB",:description => "...", :section_id => s2.id)
Node.create(:name => "Redis",:description => "...", :section_id => s2.id)
Node.create(:name => "Git",:description => "...", :section_id => s2.id)
Node.create(:name => "MySQL",:description => "...", :section_id => s2.id)
Node.create(:name => "Hadoop",:description => "...", :section_id => s2.id)
Node.create(:name => "Google",:description => "...", :section_id => s2.id)
Node.create(:name => "Java",:description => "...", :section_id => s2.id)
Node.create(:name => "Tornado",:description => "...", :section_id => s2.id)
Node.create(:name => "Linux",:description => "...", :section_id => s2.id)
Node.create(:name => "Nginx",:description => "...", :section_id => s2.id)
Node.create(:name => "Apache",:description => "...", :section_id => s2.id)
Node.create(:name => "Cloud",:description => "...", :section_id => s2.id)
s6 = Section.create(:name => "formula")
Node.create(:name => "公告",:description => "...", :section_id => s6.id)
Node.create(:name => "反馈",:description => "...", :section_id => s6.id)
Node.create(:name => "开发",:description => "...", :section_id => s6.id)
