class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_couter, comparison: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }, allow_nil: true

  after_save :updates_user_posts_counter

  def recent_post_coments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def updates_user_posts_counter
    author.posts_counter.nil? ? author.update(posts_counter: 1) : author.increment!(:posts_counter)
  end
end
