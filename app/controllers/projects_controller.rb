class ProjectsController < ApplicationController
  # GET /projects
  def index
    @projects = set_client.projects.all
    render json: @projects
  end

  # GET /projects/1
  def show
    @project = set_client.projects.find(params[:id])
    render json: @project
  end

  # POST /projects
  def create
    @client = Client.find(params[:client_id])
    @project = @client.projects.create(project_params)

    if @project.save
      render json: @project, status: :created
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /projects/1
  def update
    @project = set_client.projects.find(params[:id])
    @project.update(project_params)
  end

  # DELETE /projects/1
  def destroy
    @project = set_client.projects.find(params[:id])
    @project.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:client_id])
    end
    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:name,:description,:client,:status,:id, :client_id)
    end
end
