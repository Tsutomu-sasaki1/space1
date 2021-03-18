class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :category_id
    validates :name
    validates :nickname
    validates :self_introduction
  end

    #  - has_many : post_likes, dependent: :destroy
    #  - has_many : posts, through: :post_likes, source: :post, dependent: :destroy 
    #  
    #  - has_many : comment_likes, dependent: :destroy
    #  - has_many : comments, through: :comment_likes, source: :comment
    #  
    #  - has_many : user_communities
    #  - has_many : communities, through: :user_communities, source: :community
    #  
    #  - has_many : user_chats, dependent: :destroy
    #  - has_many : chats, through: user_chats, source: :chat
    #  
    #  - has_many : follower, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy # Relationshipモデルのfollower_idにuser_idを格納(フォロー取得)
    #  - has_many : followed, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy # Relationshipモデルのfollowed_idにuser_idを格納(フォロワー取得)
    #  - has_many :following_user, through: :follower, source: :followed #自分がフォローしているユーザー
    #  - has_many :follower_user, through: :followed, source: :follower #自分をフォローしているユーザー
     
    # 半角英数字混合のみ
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX
end
