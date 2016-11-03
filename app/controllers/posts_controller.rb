class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only:[:show,:update,:edit,:destroy, :like]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Post successfully created!"
      redirect_to @post
    else
      render 'new'
    end
  end

  def show
    @comments = Comment.where(post_id: params[:id])
    @comment = @post.comments.build
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @user.destroy
  end

  def like
    current_user.liked_posts << @post
    current_user.save
    redirect_to root_path
  end

  protected
  def post_params
    params.require(:post).permit([:body])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
