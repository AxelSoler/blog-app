class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  after_save :updates_user_posts_counter

  def recent_post_coments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def updates_user_posts_counter
    author.posts_counter.nil? ? author.update(posts_counter: 1) : author.increment!(:posts_counter)
  end
end
