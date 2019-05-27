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
        # byebug
        post = Post.create(post_params)
        if post
            post.save
            render json: {post: PostSerializer.new(post)}
        else 
            render json: {errors: post.errors.full_messages}
        end
    end

    def update

        if request.headers["Authorization"]
            post = Post.find_by(id: params[:id])
                post.update_attributes(likes: post.likes +=1)
            render json: post
        else
            post = Post.find_by(id: params[:id] )
            post.update_attributes(post_params)
        render json: post
        end
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
