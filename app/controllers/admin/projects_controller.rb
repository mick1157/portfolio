class Admin::ProjectsController < Admin::BaseController

# class Admin::ProjectsController < ApplicationController
#  before_filter :login_required
#  see private methods below
#  before_filter :find_project, :except => [:index, :new, :create]


  def index

    @projects = Project.order('created_at DESC').all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end


  end

  def show

    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end

  end

  def edit

    @project = Project.find(params[:id])

  end

  def update

    @project = Project.find(params[:id])
    @project.attributes = params[:project]
    if @project.save
      flash[:notice] = "Blog Project updated"
      redirect_to admin_projects_path
    else
      render 'edit'
    end

  end

  def new

    @project = Project.new
#    logger.debug("Project is #{@project.inspect}")

  end

  def create

    @project = Project.new(params[:project])
    if @project.save
      flash[:notice] = "Blog Project created"
      redirect_to admin_projects_path
    else
      render 'new'
    end

  end

  def destroy

#    session[:user_id] = nil
    @project = Project.find(params[:id])
    if @project.destroy
      flash[:notice] = "project Deleted Successfully"
    else
      flash[:error] = "project NOT Deleted"
    end
    redirect_to admin_projects_path
  end


  private

  def find_project
    @project = Project.find(params[:id])
  end

end
