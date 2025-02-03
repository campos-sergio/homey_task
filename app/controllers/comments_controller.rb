class CommentsController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.build(user: Current.user, message: comment_params[:message])
    if @comment.save
      render json: {}, status: :no_content # solid_cable friendly response o/
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
