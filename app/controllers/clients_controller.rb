class ClientsController < ApplicationController

  # GET /clients
  def index
    @clients = Client.all
    render json: @clients
  end

  # GET /clients/1
  def show
    @client = Client.find(params[:id])
    render json: @client
  end

  # POST /clients
  def create
    @client = Client.new(client_params)

    if @client.save
      render json: @client, status: :created
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clients/1
  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
  end

  # DELETE /clients/1
  def destroy
    @client = Client.find(params[:id])
    @client.destroy
  end

  private
    # Only allow a list of trusted parameters through.
    def client_params
      params.require(:client).permit(:name,:email,:phone)
    end
end
