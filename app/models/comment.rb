class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_save :updates_post_comments_counter

  private

  def updates_post_comments_counter
    post.comments_couter.nil? ? post.update(comments_couter: 1) : post.increment!(:comments_couter)
  end
end
