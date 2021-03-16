class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '絵画' },
    { id: 2, name: '造形' },
    { id: 3, name: '写真' },
    { id: 4, name: '映像' },
    { id: 5, name: '音楽' },
    { id: 6, name: '工作' },
    { id: 7, name: 'その為１' },
    { id: 8, name: 'その他２' },
    { id: 9, name: 'その他３' }
  ]
  include ActiveHash::Associations
  has_many :posts
  has_many :users
end
