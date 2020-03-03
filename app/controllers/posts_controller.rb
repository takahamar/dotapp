class PostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    
    def index
        @posts = Post.all.order(created_at: 'desc')
    end
    
    def show
        @post = Post.find(params[:id])
    end
    
    def new
        @post = Post.new
    end
    
    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            flash[:success] = "Post created!"
            redirect_to user_path(@post.user)
        else
            render 'new'
        end
    end
    
    def edit 
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            flash[:success] = "Post updated!"
            redirect_to user_path(@post.user)
        else
            render 'edit'
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        flash[:success] = "Post deleted!!"
        redirect_to user_path(@post.user)
    end
    
    private
        def post_params
            params.require(:post).permit(:title, :body, :picture)
        end
    
end
