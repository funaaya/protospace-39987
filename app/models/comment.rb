class Comment < ApplicationRecord
  belongs_to :prototype # tweetsテーブルとのアソシエーション
  belongs_to :user

  validates :content, presence: true
  
end
