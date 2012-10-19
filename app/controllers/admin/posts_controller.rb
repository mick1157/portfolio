class Admin::PostsController < Admin::BaseController
# class Admin::PostsController < ApplicationController

#  before_filter :login_required
#  see private methods below
#  before_filter :find_post, :except => [:index, :new, :create]




  def index

    @posts = Post.order('created_at DESC').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end


  end

  def show

    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end

  end

  def edit

    @post = Post.find(params[:id])

  end

  def update

    @post = Post.find(params[:id])
    @post.attributes = params[:post]
    if @post.save
      flash[:notice] = "Blog Post updated"
      redirect_to admin_posts_path
    else
      render 'edit'
    end

  end

  def new

    @post = Post.new
#    logger.debug("Post is #{@post.inspect}")

  end

  def create

    @post = Post.new(params[:post])
    if @post.save
      flash[:notice] = "Blog Post created"
      redirect_to admin_posts_path
    else
      render 'new'
    end

  end

  def destroy

#    session[:user_id] = nil
    @post = Post.find(params[:id])
    if @post.destroy
      flash[:notice] = "post Deleted Successfully"
    else
      flash[:error] = "post NOT Deleted"
    end
    redirect_to admin_posts_path
  end


  private

  def find_post
    @post = Post.find(params[:id])
  end

end
