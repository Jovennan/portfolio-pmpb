class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:show, :edit, :update, :destroy]

  def index
    @schedules = Schedule.new(schedule_params)
  end

  def show
  end

  def new
    @schedule = Schedule.new
  end

  def edit
  end

  def create
    @schedule = Schedule.new(schedule_params)
    respond_to do |format|
      if @schedule.save
        format.html { redirect_to @schedule, notice: 'Cronograma definido'}
        format.json { render json: @schedule, status: :created, location: @schedule }
      else
        format.html { render :new }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @schedule.update(schedule_params)
        format.html { redirect_to @schedule, notice: 'Cronograma atualizado'}
        format.json { render json: @schedule, status: :updated, location: @schedule }
      else
        format.html { render :edit }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @schedule.destroy
        format.html { redirect_to schedules_url, notice: 'Cronograma removido'}
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_schedule
      @schedule = Schedule.find(params[:id])
    end
    def schedule_params
      params.require(:schedule).permit(:initial_date, :final_date)
    end

end
