class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :comments
  has_many :likes

  def updates_user_posts_counter
    author.posts_counter.nil? ? author.update(posts_counter: 1) : author.update(posts_counter: author.posts_counter + 1)
  end
end
