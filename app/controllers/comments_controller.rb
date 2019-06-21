class CommentsController < ApplicationController
    def index
        comments = Comment.all
        render json: comments
      end

    def show
        comment = Comment.find(params[:id])
        render json: comment
    end
  
    def create
        comment = Comment.create(comment_params)
        if comment
            comment.save
            render json: {comment: commentSerializer.new(comment)}
        else 
            render json: {errors: comment.errors.full_messages}
        end
    end

    def update
        comment = Comment.find_by(id: params[:id] )
        comment.update_attributes(comment_params)
        render json: post

    end
  
    def destroy
        comment = Comment.find_by(id: params[:id])
        comment.destroy
        render json: comment
    end

    private 

    def comment_params
        # text: nil, post_id: nil, traveller_id: nil,
        params.require(:comment).permit(:traveller_id, :text, :post_id)
    end
end
