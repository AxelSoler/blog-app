class AllPostsControllers < ActionController
  def list_posts
    /users/:id/posts
  end

  def show_post
    /users/:id/posts/:id
  end
end
