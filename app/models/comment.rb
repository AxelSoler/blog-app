class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  after_save :updates_post_comments_counter

  private

  def updates_post_comments_counter
    post.increment!(:comments_counter)
  end
end
