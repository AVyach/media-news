class CommentsController < ApplicationController
    before_action :authenticate_user    
    skip_before_action :verify_authenticity_token
    
    def create
        @post = Post.find(params[:post_id])
        p = comment_params
        if not p[:body].empty?
          p[:username] = current_user.name
          @comment = @post.comments.create(p)
        end
        redirect_to post_path(@post)
    end

    def authenticate_user
        unless current_user.present?
            redirect_to new_session_path
        end
    end

    private def comment_params
        params.require(:comment).permit(:body)
    end
end
