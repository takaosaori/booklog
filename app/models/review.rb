class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :user_id, presence: true
  validates :book_id, presence: true
  validates :rank, presence: true, inclusion: 1..5
  validates :body, presence: true, allow_blank: false
    
end
