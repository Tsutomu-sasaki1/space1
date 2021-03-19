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

post1 = Post.create({title: "風景", text: "絵画です", category_id: "1", user_id: "1", image: open("#{Rails.root}/db/test_image/test1.JPG")})
post2 = Post.create({title: "彫像", text: "造形です", category_id: "2", user_id: "2", image: open("#{Rails.root}/db/test_image/test2.JPG")})
post3 = Post.create({title: "街並み", text: "写真です", category_id: "3", user_id: "3", image: open("#{Rails.root}/db/test_image/test3.JPG")})
post4 = Post.create({title: "ドキュメント", text: "映像です", category_id: "4", user_id: "4", image: open("#{Rails.root}/db/test_image/test4.JPG")})