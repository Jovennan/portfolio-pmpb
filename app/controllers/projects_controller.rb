class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :set_clients, only: [:new, :edit, :create, :update]
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
    @project.build_schedule
  end

  def edit
    @project = Project.find(params[:id])
    @programmers = Programmer.all
    # if @project.schedule.blank?
    #   @project.schedule = Schedule.new
    # end
  end

  def create
    @project = Project.new(project_params)
    @project.schedule = set_schedule

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Projeto cadastrado' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Projeto atualizado' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

    respond_to do |format|
      if @project.destroy
        format.html { redirect_to projects_url, notice: 'Projeto removido' }
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_project
      @project = Project.find(params[:id])
    end

    def set_clients
      @clients = Client.all
    end
    def set_schedule
      @schedule = Schedule.new()
      @schedule.initial_date = params[:initial_date]
      @schedule.final_date = params[:final_date]
      @schedule
    end

    def project_params
      params.require(:project).permit(:description,
                                      :client_id,
                                      # schedule_attributes: [
                                      #   :initial_date,
                                      #   :final_date
                                      # ],
                                      programmer_ids: [])
    end
end
