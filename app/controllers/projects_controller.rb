class ProjectsController < ApplicationController

  before_action :set_project, only: [:edit, :update, :show, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project was successfully created"
      redirect_to project_path(@project)
    else
      render 'new'
    end
  end

  def update
    if @project.update(project_params)
      flash[:notice] = "Project was successfully updated"
      redirect_to project_path(@project)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @project.destroy
    flash[:notice] = "Project was successfully deleted"
    redirect_to project_path
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description)
    end

end
