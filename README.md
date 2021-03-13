# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  ruby 2.6.5
  Rails 6.0.3.5

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# README

# テーブル設計

## users テーブル

| Column              | Type          | Options                       |
| ------------------- | ------------- | ----------------------------- |
| name                | string        | null: false                   |
| nickname            | string        | null: false                   |
| encrypted_password  | string        | null: false                   |
| email               | string        | null: false, unique: true     |
| self_introduction   | string        | null: false                   |
| category_id         | integer       | null: false                   |
| post_id             | references    | null: false, foreign_key: true|
| comment_id          | references    | null: false, foreign_key: true|
### Association
- has_many : likes
- has_many : comments
- has_many : posts
- has_many : user_communities
- has_many : communities, through: user_communities
- has_many : user_chats
- has_many : chats, through: user_chats
- has_many : follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # Relationshipモデルのfollower_idにuser_idを格納(フォロー取得)
- has_many : followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # Relationshipモデルのfollowed_idにuser_idを格納(フォロワー取得)
- has_many :following_user, through: :follower, source: :followed #自分がフォローしているユーザー
- has_many :follower_user, through: :followed, source: :follower #自分をフォローしているユーザー

## posts テーブル

| Column              | Type          | Options                       |
| ------------------- | ------------- | ------------------------------|
| title               | string        | null: false                   |
| text                | string        | null: false                   |
| category_id         | integer       | null: false                   |
| user_id             | references    | null: false, foreign_key: true|
| comment             | references    | null: false, foreign_key: true|
### Association
- has_many : likes
- has_many : images
- belongs_to : user
- belongs_to : comment

## chats テーブル
| Column              | Type          | Options                        |
| ------------------- | ------------- | ------------------------------ |
| comment_id          | references    | null: false, foreign_key: true |
| user_id             | references    | null: false, foreign_key: true |
### Association
- belongs_to : comment
- has_many :user_chats
- has_many :users, through: user_chats

## comments テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment      | string     | null: false                    |
| user_id      | references | null: false, foreign_key: true |
### Association
- has_many :likes
- belongs_to : user

## communities テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| comment_id   | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |
### Association
- has_many : user_communities
- has_many : users, through: user_communities
- belongs_to : comment

## likes テーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| post_id      | references | null: false, foreign_key: true |
| comment_id   | references | null: false, foreign_key: true |
### Association
- belongs_to :user
- belongs_to :post
- belongs_to :comment

## relationship テーブル(中間)
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| follower_id  | integer    | null: false, foreign_key: true |
| followed_id  | integer    | null: false, foreign_key: true |
### Association
- has_many :follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # フォロー取得(フォローする人)
- has_many :followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # フォロワー取得(フォローされる人)
- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"

## user_communities テーブル(中間)
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user_id      | references | null: false, foreign_key: true |
| community_id | references | null: false, foreign_key: true |
### Association
- belongs_to :community
- belongs_to :user