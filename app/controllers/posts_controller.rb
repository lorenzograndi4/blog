# posts_controller.rb

class PostsController < ApplicationController

  # A list of all posts
  def index
  	@posts = Post.all
  end

  # An empty Post form
  def new
  	@post = Post.new
  end

  # Create a Post from the form params
  def create
  
  	if @post = Post.create(post_params)
  	  redirect_to root_path # or action: :index
  	else 
      render :new
    end
  
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])

  	if @post.update(post_params)
  		redirect_to @post
  	else
  		render :edit
  	end
  end

  def destroy
  	@post = Post.find(params[:id])

  	if @post.destroy
  		redirect_to root_path
  	else
  		redirect_to @post
  	end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
