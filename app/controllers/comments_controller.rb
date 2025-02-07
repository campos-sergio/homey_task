class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = Comment.new(project_id: @project.id, user_id: Current.user.id, message: comment_params[:message])
    if @comment.save
      redirect_to project_comments_path(@project), notice: "Thanks for your comment."
    else
      flash.now[:alert] = "Please fix the errors below and try again."
      render "projects/show", status: :unprocessable_entity
    end
  end

  private
    def comment_params
      params.expect(comment: [ :message ])
    end
end
