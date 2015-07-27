require "active_record"
require_relative "connect"

# ActiveRecord::Base.logger = Logger.new STDOUT # Moved to a diff. file, connect.rb
#
# ActiveRecord::Base.establish_connection(
#   adapter: "mysql2",
#   host: "45.55.245.247",
#   username: "wyncode",
#   password: "wyncode",
#   database: "wyncode"
# )


class User < ActiveRecord::Base

end

# p User.all.map { |u| u.name }
# p User.all.map(&:name)
# user = User.first # outputs first item in query
# # p user.class, user # prints out query result
#
# user = User.last # outputs last item in query
# puts "id:\t#{user.id}"
# puts "name:\t#{user.name}"
# puts "email:\t#{user.email}"

# mysql>  SELECT `users`.* FROM `users`;
# +----+----------------+--------------------------------+
# | id | name           | email                          |
# +----+----------------+--------------------------------+
# |  1 | Christina      | steve@soverin.net              |
# |  2 | Jonathan       | Jon@JonRose.co                 |
# |  3 | David          | steve@soverin.net              |
# |  4 | Arielle        | arielle.gruman@yahoo.com       |
# |  5 | Ricky          | prahasik@gmail.com             |
# |  6 | Adriana        | steve@soverin.net              |
# |  7 | Ana            | ana@wyncode.com                |
# |  9 | Andres         | afre92@gmail.com               |
# | 10 | Angelica       | jcs571@yahoo.com               |
# | 11 | Anthony        | anthonyatamayo@gmail.com       |
# | 12 | Ariel          | steve@soverin.net              |
# | 13 | Ben            | bens640@gmail.com              |
# | 14 | Carlos         | cquiro@gmail.com               |
# | 15 | Daniel         | danllinas@gmail.com            |
# | 16 | Dena           | dena@gmail.com                 |
# | 17 | Lenora         | steve@soverin.net              |
# | 18 | Matias         | mfbeeck@gmail.com              |
# | 19 | Michael        | michaelem3@gmail.com           |
# | 20 | Sean H.        | seathony@gmail.com             |
# | 21 | Sean S.        | me@seansellek.com              |
# | 22 | Sofia          | steve@soverin.net              |
# | 24 | Volney         | volneytejeda10@gmail.com       |
# | 25 | weston cooper  | weston@westoncooper.com        |
# | 27 | Prahasi        | pk285@nova.edu                 |
# | 32 | Tucan Sam      | FruitLoops@YUM.com             |
# | 35 | Homer Simpson  | NULL                           |
# | 36 | Tony the Tiger | Theyyyre GREEAAT!!@cereal.co   |
# | 38 | Cookie Monster | COOOKIES!!!!@ALLTHECOOKIES.YUM |
# | 44 | Ed Toro        | student@wyncode.co             |
# | 51 | Sherlock       | sherlock@xyz.co                |
# | 53 | Zach           | zhpdeals@gmail.com             |
# | 54 | Pepe Grillo    | NULL                           |
# | 62 | Anders         | ang.palm@hotmail.com           |
# | 64 | Matthew        | matthewcorrao9@gmail.com       |
# | 69 | Mr.Monopoly    | MoneyBags@BoardWalk.co         |
# | 70 | Damon          | NULL                           |
# | 71 | Mashon         | NULL                           |
# | 72 | Joann          | NULL                           |
# | 73 | Ravi           | NULL                           |
# | 74 | Chris          | NULL                           |
# | 75 | Paul           | NULL                           |
# | 76 | Juan           | NULL                           |
# | 77 | Juvenal        | NULL                           |
# | 78 | Alec           | NULL                           |
# | 79 | Robert         | NULL                           |
# | 80 | Pat            | NULL                           |
# | 81 | Jeff           | NULL                           |
# | 82 | Adam           | NULL                           |
# | 83 | Angel          | NULL                           |
# +----+----------------+--------------------------------+
# 49 rows in set (0.16 sec)


# now let us grab 82nd item

ActiveRecord::Migration.add_index :users, :name, unique: true

u = User.find(82)
p u.name # prints out "Adam"

# finding by for example, name ; searching using other fields, Rails will default to id

u2 = User.find_by name: "Robert"
p u2.id, u2.name

# u3 = User.find_by name: "Manny" # if find_by fails, it will return nil
# p u3.id, u3.name

# u3 = User.find_by! name: "Manny" # added ! causes it to fail loudly
# p u3.id, u3.name

u4 = User.find_by! name: "Juvenal"
p u4.id, u4.name


# SELECT `users`.* FROM `users`; SQL query
# EXPLAIN SELECT `users`.* FROM `users`; <<< turns table into a single row (added index?)


# EXPLAIN SELECT `users`.* FROM `users` WHERE `users`.`id` = "83" LIMIT 1;
