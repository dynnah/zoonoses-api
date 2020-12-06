class CuidadorsController < ApplicationController
  before_action :authorize_request_cuidador, except: :create
  before_action :find_cuidador, except: %i[create index]
  # before_action :set_cuidador, only: [:show, :update, :destroy]

  # GET /cuidadors
  def index
    @cuidadors = Cuidador.all

    render json: @cuidadors.to_json(:only => [:id, :cpf, :nome, :sexo, :telefone, :datanasc, :email],:include => :animal), status: :ok
  end

  # GET /cuidadors/1
  def show
    render json: @cuidador.to_json(:only => [:id, :cpf, :nome, :sexo, :telefone, :datanasc, :email], :include => :animal), status: :ok
  end

  # POST /cuidadors
  def create
    @cuidador = Cuidador.new(cuidador_params)

    if @cuidador.save
      render json: @cuidador, status: :created, location: @cuidador
    else
      render json: @cuidador.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cuidadors/1
  def update
    if @cuidador.update(cuidador_params)
      render json: @cuidador
    else
      render json: @cuidador.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cuidadors/1
  def destroy
    @cuidador.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cuidador
      @cuidador = Cuidador.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cuidador_params
      params.require('cuidador').permit(:id, :cpf, :nome, :sexo, :telefone, :datanasc, :email, :password, :password_confirmation, animal_attributes: [:id, :nome, :raca, :sexo, :idade, :peso])
    end

    def find_cuidador
      @cuidador = Cuidador.find_by_id!(params[:_id])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'Cuidador not found' }, status: :not_found
    end
end
