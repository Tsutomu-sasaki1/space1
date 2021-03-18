# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create({name: "ネズミ", nickname:"ねずこ", email: "user1@user.com", password: "nezu111", self_introduction: "ねずこです",category_id: "2"})
user2 = User.create({name: "ウサギ", nickname:"うさこ", email: "user2@user.com", password: "usa222", self_introduction: "うさこです",category_id: "3"})
user3 = User.create({name: "タイガー", nickname:"とらこ", email: "user3@user.com", password: "tora222", self_introduction: "とらこです",category_id: "4"})
user4 = User.create({name: "カメ", nickname:"かめこ", email: "user4@user.com", password: "kame222", self_introduction: "かめこです",category_id: "5"})