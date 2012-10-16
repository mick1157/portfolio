class HomeController < ApplicationController

# GET  /    (root)
# GET  /home
  def index
    @post = Post.order("created_at DESC").all
  end
end
