class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  def index
    @clients = Client.all
  end

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def edit
    @client = Client.find(params[:id])
  end

  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Cliente cadastrado' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end 

  def update
    
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Cliente atualizado' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end 

  def destroy

    respond_to do |format|
      if @client.destroy
        format.html { redirect_to clients_url, notice: 'Cliente removido' }
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end 

  private
    def set_client 
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:name)
    end 
end
