class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		find_post
	end

	def new
		@post = Post.new
	end

	def create
	  @post = Post.new(post_params(:title, :description))
	  @post.save
	  redirect_to post_path(@post)
	end

	def update
	  find_post
	  @post.update(post_params(:title))
	  redirect_to post_path(@post)
	end

	def edit
	  find_post
	end

	private

	def post_params(*args)
		params.require(:post).permit(:title, :description)
	end

	def find_post
		@post = Post.find(params[:id])
	end

end
