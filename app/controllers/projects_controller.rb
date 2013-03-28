class ProjectsController < ApplicationController
  before_filter :find_project, :only => [:show,
                                         :edit,
                                         :update,
                                         :destroy]
  def index
    @projects = Project.all
  end
  
  def new
    @project = Project.new
  end
  
  def create
    # p params
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project, 
        :notice => "Project has been created."
    else
      flash[:alert] = "Project has not been created."
      render :action => "new" 
    end
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def edit
    @project = Project.find(params[:id])
  end
  
  def update
    @project = Project.find(params[:id])
    if @project.update_attributes(params[:project]) 
      redirect_to @project,
        :notice => "Project has been updated."
    else
      flash[:alert] = "Project has not been updated."
      render :action => "edit"
    end
  end
  
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path,
      :notice => "Project has been deleted."
  end
  
  private
  def project_params
    params.require(:project).permit(:name, :description)
  end

  def find_project
    @project = Project.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to projects_path,
      :alert => "The project you were looking" +
                " for could not be found."
  end
end
