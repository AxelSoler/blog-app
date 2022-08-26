class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments, foreign_key: 'post_id', dependent: :delete_all
  has_many :likes, foreign_key: 'post_id', dependent: :delete_all

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  after_create :updates_user_posts_counter
  after_destroy :less_user_posts_counter

  def recent_post_coments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def updates_user_posts_counter
    author.increment!(:posts_counter)
  end

  def less_user_posts_counter
    author.decrement!(:posts_counter)
  end
end
