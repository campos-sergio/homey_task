class ProjectsController < ApplicationController
  allow_unauthenticated_access only: %i[ index show ]
  before_action :set_models, only: %i[ show edit update ]

  def index
    @projects = Project.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
    @project.comments.build(
      user: Current.user,
      message: "Project status updated from '#{@project.status}' to '#{project_params[:status]}'."
    )

    if @project.update(project_params)
      redirect_to @project, notice: "Project status updated successfully."
    else
      flash.now[:alert] = "Please fix the errors below and try again."
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def set_models
      @project = Project.find(params.expect(:id))
      @comment = Comment.new
    end

    def project_params
      params.expect(project: [ :status ])
    end
end
