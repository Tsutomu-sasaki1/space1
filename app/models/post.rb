class Post < ApplicationRecord
  with_options presence: true do
    validates :title
    validates :text
    validates :category_id
    validates :user_id
  end
  
end
