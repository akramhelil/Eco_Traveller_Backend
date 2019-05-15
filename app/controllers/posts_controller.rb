class PostsController < ApplicationController

    def index
        posts = Post.all
        render json: posts
      end

    def show
        post = Post.find(params[:id])
        render json: post
    end
  
    def create
        post = Post.find_or_create_by(post_params)
        if post
            post.save
            render json: {post: PostSerializer.new(post)}
        else 
            render json: {errors: post.errors.full_messages}
        end
    end

    def update
        post = Post.find_by(id: params[:id])
        byebug
    end
  
    def destroy
        post = Post.find_by(id: params[:id])
        post.destroy
        render json: post
    end

    private 

    def post_params
        # trip_id: nil, title: nil, likes: nil, content: nil, img_url: nil
        params.require(:post).permit(:trip_id, :title, :likes, :content, :img_url)
    end
    
end
