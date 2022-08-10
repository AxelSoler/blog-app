class Like < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_save :updates_post_likes_counter

  private

  def updates_post_likes_counter
    post.likes_counter.nil? ? post.update(likes_counter: 1) : post.increment!(:likes_counter)
  end
end
