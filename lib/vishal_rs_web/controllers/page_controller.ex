defmodule VishalRsWeb.PageController do
  use VishalRsWeb, :controller
  alias VishalRs.Blog

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def blog(conn, _params) do
    # Get all posts from the blog
    posts = Blog.list_posts()
    # Pass the posts to the template
    render(conn, :blog, posts: posts, layout: false)
  end

  def essay(conn, params) do
    post = Blog.get_post!(params["id"])
    render(conn, :essay, post: post, layout: false)
  end
end
